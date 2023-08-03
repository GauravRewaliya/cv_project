class CandidatesController < ApplicationController
  before_action :set_candidate, only: %i[ show edit update destroy ]

  def index
      @candidates = Candidate.all
  end

  def show
    @candidate = Candidate.find(params[:id])
  end

  def new
    @candidate = Candidate.new
    @candidate.build_profile
  end

  def edit
  end
  
  def create
    @candidate = Candidate.new(candidate_params) 

    @candidate.created_by = current_user.email
    @candidate.updated_by = current_user.email

    if @candidate.save
      redirect_to @candidate, notice: 'Candidate and Profile were successfully created.'
    else
      render :new
    end
  end

  
  def update
    @candidate.updated_by = current_user.email
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
        params.require(:candidate).permit(:name, :employ_id, profile_attributes: [:id ,:gender,:email, :contact,  :address ,profile_core_tech_attributes: [:tech_stack_id],supportive_skill_ids:[]] ,linkable_core_tech_attributes: [:tech_stack_id] ,supportive_tech_ids:[])
    end
end
