class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: %i[ show edit update destroy save_layout_data]

  def index
    @curriculum_vitaes = CurriculumVitae.all
  end

  
  def show
    # @resume_html = render_to_string(partial: 'layout' , locals: { curriculum_vitae: @curriculum_vitae})
  end

  
  def new
    @curriculum_vitae = CurriculumVitae.new
  end

  
  def edit
  end

  
  def create

    @curriculum_vitae = CurriculumVitae.new(curriculum_vitae_params)

    c = nil
    if !params[:candidate_id].blank?
    c = Candidate.find(params[:candidate_id])
    end
    @curriculum_vitae.candidate = c 

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

  def save_layout_data
   puts "////////////////////////////////////////////////////"
   @resume_html = render_to_string(partial: 'layout' , locals: { curriculum_vitae: @curriculum_vitae})
    # layout = Layout.new
    # layout.save_html = @resume_html
    # layout.save
    Layout.create(save_html: @resume_html).save

   redirect_to curriculum_vitaes_path, notice: "Layout is saved"   
  end

  def layout_index
    @layouts = Layout.all
  end

  def show_layout_data
    @layout = Layout.find( params[:id])
  end

  def layout_destroy
    Layout.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to layout_index_path, notice: "Layout was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_curriculum_vitae
      @curriculum_vitae = CurriculumVitae.find(params[:id])
    end

    
    def curriculum_vitae_params
      params.require(:curriculum_vitae).permit(:objective , :profile_desc,project_ids: [])                                                                                #  curriculum_vitae_core_tech me tech_stack_id lega
    end
end
