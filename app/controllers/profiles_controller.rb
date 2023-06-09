class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  # before_action :authenticate_user!

  def index
    if !params['search'].blank?
      @profiles = Profile.where('lower(email) LIKE ?' ,"%"+params['search']+"%" )
      else
      @profiles = Profile.all
      end
    # @profiles = Profile.all
  end

  
  def show
  end

  
  def new
    @profile = Profile.new
  end

  
  def edit
  end

  
  def create
    @profile = Profile.new(profile_params)

    respond_to do |format|
      if @profile.save
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @profile.update(profile_params)
        c = nil 
        if !params[:core_skill_id].blank?
        c = Profile.find(params[:core_skill_id])
        end
        @profile.core_skill  = c 
        format.html { redirect_to profile_url(@profile), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    # @profile.supportive_skills = [] # handle in model
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_profile
      @profile = Profile.find(params[:id])
    end

    
    def profile_params
      # params.require(:profile).permit(:email, :contact, :address,:candidate_id ,profile_core_tech_attributes: [:tech_stack_id],supportive_skill_ids:[])
      params.require(:profile).permit(:gender,:email, :contact, :address,:candidate_id ,supportive_skill_ids:[])
                                                                                  #  profile_core_tech me tech_stack_id lega
    end
end
