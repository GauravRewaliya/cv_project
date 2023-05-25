class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

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
    # @candidate = Candidate.new(candidate_params)
    # debugger
    # respond_to do |format|
    #   if @candidate.save
    #     # rollback
    #     @profile = Profile.new(profile_params)
    #     debugger
    #     @profile.candidate_id = @candidate.id
    #     if @profile.save
    #       format.html { redirect_to candidate_url(@candidate), notice: "Candidate was successfully created." }
    #       format.json { render :show, status: :created, location: @candidate }
    #     else 
    #       @candidate.rollback
    #       format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @profile.errors, status: :unprocessable_entity }
    #     end
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @candidate.errors, status: :unprocessable_entity }
    #   end
    # end

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
    # @candidate.projects = []
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
      params.require(:candidate).permit(:name, :employ_id, profile_attributes: [:email, :contact,  :address ,supportive_skill_ids:[]])

    end
    # def profile_params
    #   debugger
    #   params.require(:candidate[:profile]).permit(:email, :contact, :skill , :address,:candidate_id)
    # end
end
