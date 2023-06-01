class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]


  def index
    @candidates = Candidate.all
  end

  
  def show
    # 
    @candidate = Candidate.find(params[:id])
  end

  
  def new
    # @candidate = Candidate.new
    # @profile = Profile.new
    @candidate = Candidate.new
    @profile = @candidate.build_profile
  end

  
  def edit
  end

  
  def create
    @candidate = Candidate.new(candidate_params)
    # @profile = @candidate.build_profile(profile_params)
  
    if @candidate.save
      redirect_to @candidate, notice: 'Candidate and Profile were successfully created.'
    else
      render :new
    end
  end

  
  def update
    respond_to do |format|
      if candidate_params[:profile_core_tech_attributes].nil? || candidate_params[:profile_core_tech_attributes][:tech_stack_id].blank?
        if @candidate.profile
          @candidate.profile.core_skill = nil
        end
      end
      if @candidate.update(candidate_params)
        format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    # @candidate.profiles = []
    @candidate.destroy

    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    
    def candidate_params
      # params.require(:candidate).permit(:name, :employ_id , :profile_id)
      # params.require(:candidate).permit(:name, :employ_id, profile: [:email, :contact, :skill, :address])
      params.require(:candidate).permit(:name, :employ_id, profile_attributes: [:gender,:email, :contact,  :address ,profile_core_tech_attributes: [:tech_stack_id],supportive_skill_ids:[]])

    end
    # def profile_params
    #   debugger
    #   params.require(:candidate[:profile]).permit(:email, :contact, :skill , :address,:candidate_id)
    # end
end
