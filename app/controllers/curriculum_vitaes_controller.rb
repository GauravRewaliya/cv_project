class CurriculumVitaesController < ApplicationController
  before_action :set_curriculum_vitae, only: %i[ show edit update destroy save_layout_data]
  layout 'cv' ,only: %i[ show]

  def index
    if !params['search'].blank?
      # cs = Candidate.all
      # cs_ids = cs.pluck(:id)
      # CurriculumVitae.where(candidate_id: cs_ids)

      
      # CurriculumVitae.joins(:candidate).where(candidates: { name: 'GauravRR' })
     @curriculum_vitaes =  CurriculumVitae.joins(:candidate).where('lower(candidates.name) LIKE ?' ,"%#{params['search'].downcase}%" )
      # @curriculum_vitaes = CurriculumVitae.where('lower(name) LIKE ?' ,"%#{params['search'].downcase}%" )
      else
      @curriculum_vitaes = CurriculumVitae.all
      end
  end

  
  def show
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
