class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: %i[ show edit update destroy save_layout_data download  pdf_html_req docx_html_req]
  layout 'cv' ,only: %i[ show]

  def index
    if !params['search'].blank?
      @curriculum_vitaes =  CurriculumVitae.joins(:candidate).where('lower(candidates.name) LIKE ?' ,"%#{params['search'].downcase}%" )
      else
      @curriculum_vitaes = CurriculumVitae.all
      end
  end

 def  pdf_html_req 
  # pdf_data =   generate_pdf(@curriculum_vitae) #by erb

  pour_html = get_html(@curriculum_vitae)
  pdf_data = WickedPdf.new.pdf_from_string(pour_html)
  send_data pdf_data , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'
 
  # grover = Grover.new( pour_html , format: 'A4' ).to_pdf
  # send_data grover , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'

  # respond_to do |format|  
  #   format.html { send_data pdf_data, filename: 'curriculum_vitae.pdf', type: 'application/pdf' }
  # end
 end

  def docx_html_req
    pour_html = get_html(@curriculum_vitae)
    docx_file = Htmltoword::Document.create(pour_html)

    # pdf_data = WickedPdf.new.pdf_from_string(pour_html)
    # pdf_file = 'output.pdf' # Specify the output PDF file path
    # File.binwrite(pdf_file, pdf_data)
    # docx_file = 'output.docx' 
    # # system("pandoc -s #{pdf_file} -o #{docx_file}")
    # system("pandoc -s #{pdf_file} -o #{docx_file} --from=pdf --to=docx")

    send_data docx_file, filename: 'cv.docx', disposition: 'attachment'
  end

  def get_html(curriculum_vitae)
    html_txt = render_to_string(partial: "html_templates/#{curriculum_vitae.template_name.sub(/^_/, '')}" , locals: { curriculum_vitae: curriculum_vitae} ,layout: false)
    html_txt
   end

  def html_txt_erb(curriculum_vitae) # by own usig ERB
    partial_path = Rails.root.join('app', 'views', 'html_templates', curriculum_vitae.template_name+".html.erb")
    partial_content = File.read(partial_path)
    
    layout_path = Rails.root.join('app', 'views', 'layouts', 'cv.html.erb')
    layout_content = File.read(layout_path)
  
    combined_txt = layout_content.sub('<%= yield %>', partial_content)
    template_erb = ERB.new(combined_txt)
    pour_html = template_erb.result(binding)
  end

  def show
    # @resume_html = render_to_string(partial: 'layout' , locals: { curriculum_vitae: @curriculum_vitae})
    # debugger
  end

  
  def new
    @curriculum_vitae = CurriculumVitae.new
  end

  
  def edit
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

    # c = nil
    # if !params[:candidate_id].blank?
    # c = Candidate.find(params[:candidate_id])
    # end
    # @curriculum_vitae.candidate = c 

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
      params.require(:curriculum_vitae).permit(:candidate_id ,:template_name,:experience ,:image,:objective ,:profile_desc, curriculum_vitae_core_tech_attributes: [:tech_stack_id] ,supportive_skill_ids:[],project_ids: [] )
    end
end
