class CurriculumVitaesController < ApplicationController
  # before_action :set_curriculum_vitae, only: %i[show edit update destroy pdf_html_req docx_html_req]
  before_action :set_curriculum_vitae, only: %i[show edit update]
  layout 'cv' ,only: %i[ show]
  skip_before_action :verify_authenticity_token

  def index
      # @curriculum_vitaes = CurriculumVitae.all
      # @curriculum_vitaes = CurriculumVitae.includes(:candidate ,:cv_projects).all
      @curriculum_vitaes = CurriculumVitae.eager_load(:candidate ,:cv_projects).all
  end

  def  pdf_html_req 
    cv_id = params[:id]
    output_path = "public/temp/tempCv_#{cv_id}.pdf"

    download_cache = CvDownloadedData.find_or_initialize_by(cv_id: cv_id)
    if download_cache.pdf_downloaded.blank? || !File::exist?(output_path)
      pour_html = get_html(cv_id)
      DocumentWorker.perform_async(pour_html , cv_id) # pass as stirng ,integer , not obj only
      # DocumentWorker.perform_in(5.minutes, pour_html, @curriculum_vitae.id) # after 5 min
      render json: { status: 'processing', cv_id: cv_id }
    else 
      pdf_data = File.read(output_path)
      pdf_blob = Base64.encode64(pdf_data)
      render json: { status: 'ready' ,blob: pdf_blob}
    end
  end

  def pdf_status
    cv_id = params[:id]
    if File::exist?( "public/temp/tempCv_#{cv_id}.pdf")
      render json: { status: 'ready' }
    else
      render json: { status: 'processing' }
    end
  end
  def  pdf_download
    cv_id = params[:id]
    output_path = "public/temp/tempCv_#{cv_id}.pdf"
    if File::exist?(output_path)
      pdf_data  = File.read(output_path)
      send_data pdf_data , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'
    else
      download_cache = CvDownloadedData.find_by(cv_id: cv_id)
      if !download_cache.blank?
        download_cache.update(pdf_downloaded: false)
      end
      render json: { status: '404' }
    end
  end

  # pdf_data = WickedPdf.new.pdf_from_string(pour_html)
  # send_data pdf_data , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'
 
  def docx_html_req
    cv_id = params[:id]
    pour_html = get_html(cv_id)
    pdf_data = WickedPdf.new.pdf_from_string(pour_html)
    input_path = "public/tempCv.pdf"
    File.open(input_path,'wb'){ |file| file << pdf_data}

    # PDF req.. 
    system(" lowriter --headless --infilter='writer_pdf_import' --convert-to doc:'MS Word 97' public/tempCv.pdf --outdir public/")
    output_path = "public/tempCv.doc"
    doc_data = File.read(output_path)

    send_data doc_data, filename: "grCv.doc", type: "application/msword", disposition: 'attachment' 
  end

  def get_html(cv_id)
    curriculum_vitae = CurriculumVitae.includes(candidate: :profile ,cv_projects: [:domain , :proj_core_skill ,:proj_supportive_skills ] ).find(cv_id)
    html_txt = render_to_string(partial: "html_templates/#{curriculum_vitae.template_name}" , locals: { curriculum_vitae: curriculum_vitae} ,layout: false)
    html_txt
   end

  def show
  end

  def new
    @curriculum_vitae = CurriculumVitae.new
    @curriculum_vitae.company_experiences.build
    @curriculum_vitae.cv_projects.build
    # @all_supportive_skill = TechStack.all
    # @all_core_skill = TechStack.core_skills.order(:title)
    # @all_domain = Domain.order(:title)
  end

  
  def edit
    @curriculum_vitae.company_experiences.build if @curriculum_vitae.company_experiences.empty?
    @curriculum_vitae.cv_projects.build if @curriculum_vitae.cv_projects.empty?
  end

  
  def create

    @curriculum_vitae = CurriculumVitae.new(curriculum_vitae_params)
    @curriculum_vitae.created_by = current_user.email
    @curriculum_vitae.updated_by = current_user.email
    respond_to do |format|
      if @curriculum_vitae.save
        format.html { redirect_to curriculum_vitae_url(@curriculum_vitae), notice: "CurriculumVitae was successfully created." }
        format.json { render :show, status: :created, location: @curriculum_vitae }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    @curriculum_vitae.updated_by = current_user.email
    @curriculum_vitae.company_experiences.reject(&:persisted?).each(&:destroy)
    @curriculum_vitae.cv_projects.reject(&:persisted?).each(&:destroy)
    @curriculum_vitae.updated_by = current_user.email
    respond_to do |format|
      if @curriculum_vitae.update(curriculum_vitae_params)
        format.html { redirect_to curriculum_vitae_url(@curriculum_vitae), notice: "CurriculumVitae was successfully updated." }
        format.json { render :show, status: :ok, location: @curriculum_vitae }
     else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @curriculum_vitae.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @curriculum_vitae = CurriculumVitae.find(params[:id])
    @curriculum_vitae.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitaes_url, notice: "CurriculumVitae was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private  
    def set_curriculum_vitae
      # @curriculum_vitae = CurriculumVitae.find(params[:id])
      @curriculum_vitae = CurriculumVitae.includes(candidate: :profile ,cv_projects: [:domain , :proj_core_skill ,:proj_supportive_skills ] ).find(params[:id])
      
      @all_supportive_skill = TechStack.all
      @all_core_skill = TechStack.core_skills.order(:title)
      @all_domain = Domain.order(:title)
    end
    
    def curriculum_vitae_params
      params.require(:curriculum_vitae).permit(:candidate_id ,:template_name,:experience ,:image,:objective ,:profile_desc, linkable_core_tech_attributes: [:tech_stack_id] ,supportive_skill_ids:[],company_experiences_attributes: [:id ,:curriculum_vitae_id , :company_name , :start_date , :end_date ,:role ,:_destroy] ,cv_projects_attributes:[:id,:original_project_id,:title,:desc,:role ,:responsibility,:start_date,:end_date, :team_size ,:domain_id ,:_destroy,:proj_core_skill_id,proj_supportive_skill_ids:[] ])
    end
end
