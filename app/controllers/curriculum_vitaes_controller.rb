class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: %i[ show edit update destroy save_layout_data download  pdf_html_req docx_html_req doc_html_req]
  layout 'cv' ,only: %i[ show]

  def index
      # @curriculum_vitaes = CurriculumVitae.all
      # @curriculum_vitaes = CurriculumVitae.includes(:candidate ,:cv_projects).all
      @curriculum_vitaes = CurriculumVitae.eager_load(:candidate ,:cv_projects).all
  end

 def  pdf_html_req 
  pour_html = get_html(@curriculum_vitae)
  pdf_data = WickedPdf.new.pdf_from_string(pour_html)
  send_data pdf_data , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'
 end
 
  def docx_html_req
    pour_html = get_html(@curriculum_vitae)
    pdf_data = WickedPdf.new.pdf_from_string(pour_html)
    input_path = "public/tempCv.pdf"
    File.open(input_path,'wb'){ |file| file << pdf_data}
    system(" lowriter --headless --infilter='writer_pdf_import' --convert-to doc:'MS Word 97' public/tempCv.pdf --outdir public/")
    output_path = "public/tempCv.doc"
    doc_data = File.read(output_path)

    send_data doc_data, filename: "grCv.doc", type: "application/msword", disposition: 'attachment' 
  end

  def get_html(curriculum_vitae)
    html_txt = render_to_string(partial: "html_templates/#{curriculum_vitae.template_name}" , locals: { curriculum_vitae: curriculum_vitae} ,layout: false)
    html_txt
   end

  def show
  end

  def new
    @curriculum_vitae = CurriculumVitae.new
    @curriculum_vitae.company_experiences.build
    @curriculum_vitae.cv_projects.build
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
    @curriculum_vitae.destroy
    respond_to do |format|
      format.html { redirect_to curriculum_vitaes_url, notice: "CurriculumVitae was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private  
    def set_curriculum_vitae
      @curriculum_vitae = CurriculumVitae.find(params[:id])
    end
    
    def curriculum_vitae_params
      params.require(:curriculum_vitae).permit(:candidate_id ,:template_name,:experience ,:image,:objective ,:profile_desc, linkable_core_tech_attributes: [:tech_stack_id] ,supportive_skill_ids:[],company_experiences_attributes: [:id ,:curriculum_vitae_id , :company_name , :start_date , :end_date ,:role ,:_destroy] ,cv_projects_attributes:[:id,:original_project_id,:title,:desc,:role ,:responsibility,:start_date,:end_date, :team_size ,:domain_id ,:_destroy,:proj_core_skill_id,proj_supportive_skill_ids:[] ])
    end
end
