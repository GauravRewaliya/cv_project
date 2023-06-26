class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: %i[ show edit update destroy save_layout_data download  pdf_html_req ]
  layout 'cv' ,only: %i[ show]

  def index
    if !params['search'].blank?
      # cs = Candidate.all
      # cs_ids = cs.pluck(:id)
      # CurriculumVitae.where(candidate_id: cs_ids)

      
      # CurriculumVitae.joins(:candidate).where(candidates: { name: 'GauravRR' })
     @curriculum_vitaes =  CurriculumVitae.joins(:candidate).where('lower(candidates.name) LIKE ?' ,"%#{params['search'].downcase}%" )
      else
      @curriculum_vitaes = CurriculumVitae.all
      end
  end

  

  # def download
  #   # @cv = CV.find(params[:id])
  #   partial_path = Rails.root.join('app', 'views', 'html_templates', @curriculum_vitae.template_name+".html.erb")
  #   str = render_to_string(file: partial_path, locals: { curriculum_vitae: @curriculum_vitae })
  #  if str.present?
  #    doc = Docx::Document.new
  #    doc.paragraphs << Docx::Elements::Paragraph.new(str)
    
  #   send_data doc.to_blob, filename: 'cv.docx', disposition: 'attachment'
  # else
  #   redirect_to cucrriculum_vitaes_path(), notice: 'CV content is not available.'
  # end
  # end

 def docx (curriculum_vitae)
 
  
  # layout_content = render_to_string(
    #   # file: 'views/layouts/application',
  #   file: Rails.root.join('app', 'views', 'layouts', 'application.html.erb'),
  #   layout: false,
  #   locals: { content: partial_content }
  # )
   
  # docx_content = Htmltoword::Document.create(layout_content)

  #   template = ERB.new(layout_content)
# rendered_content = template.result(binding)

  pour_html = html_txt_erb(curriculum_vitae)
docx_content = Htmltoword::Document.create(pour_html)
  send_data docx_content, filename: 'cv.docx', disposition: 'attachment'

 end

  def download
    # @resume_html = render_to_string(partial: 'layout' , locals: { curriculum_vitae: @curriculum_vitae})
    respond_to do |format|
    format.pdf { send_data generate_pdf(@curriculum_vitae), filename: 'curriculum_vitae.pdf', type: 'application/pdf' }
    # format.doc { send_data generate_doc(@curriculum_vitae), filename: 'curriculum_vitae.doc', type: 'application/msword' }
    format.docx { send_data generate_docx(@curriculum_vitae), disposition: "attachment" }
    # format.docx { send_data generate_docx(@curriculum_vitae), filename: 'curriculum_vitae.docx', type: 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' }
    end
  end
 
 def get_html(curriculum_vitae)
  html_txt = render_to_string(partial: "html_templates/#{curriculum_vitae.template_name.sub(/^_/, '')}" , locals: { curriculum_vitae: curriculum_vitae} ,layout: false)
  html_txt
 end

 def  pdf_html_req 
  # pdf_data =   generate_pdf(@curriculum_vitae) 
  pdf_data =pdf_standard(@curriculum_vitae)
 
  # send_data pdf_data , filename: "grCv.pdf" ,type: "application/pdf" ,disposition: 'attachment'
  respond_to do |format|  
    format.html { send_data pdf_data, filename: 'curriculum_vitae.pdf', type: 'application/pdf' }
    end
 end

  def pdf_standard(curriculum_vitae)
    pour_html = get_html(curriculum_vitae)
   
    pdf = WickedPdf.new.pdf_from_string(pour_html)
    pdf 
    
    # grover = Grover.new( pour_html , format: 'A4' ,options: { args: ['--disable-setuid-sandbox']}).to_pdf
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

  def generate_pdf(curriculum_vitae)    
  # Generate PDF using Prawn
  # pdf = Prawn::Document.new
  # pdf.text pour_html
  
  # pdf.text(pour_html, inline_format: true)   # prawan save as simple txt
  # pdf.render

  pour_html = html_txt_erb(curriculum_vitae)  # erb issues
  # pour_html = get_html(curriculum_vitae)  # template not found if else then html req
  pdf = WickedPdf.new.pdf_from_string(pour_html)
  pdf 
end

def generate_docx(curriculum_vitae)

    pour_html = html_txt_erb(curriculum_vitae)

    docx_content = Htmltoword::Document.create(pour_html, 'curriculum_vitae.docx')
    docx_content

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

    c = nil
    if !params[:candidate_id].blank?
    c = Candidate.find(params[:candidate_id])
    end
    @curriculum_vitae.candidate = c 

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
