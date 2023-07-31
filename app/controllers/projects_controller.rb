class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  def index
      @projects = Project.all
  end
  
  def show
  end

  def new
    @project = Project.new
  end

  def edit
  end

  def create
    @project = Project.new(project_params)

    @project.created_by = current_user.email
    @project.updated_by = current_user.email
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if project_params[:linkable_core_tech_attributes][:tech_stack_id].blank?
      @project.core_skill = nil
    end
    
    @project.updated_by = current_user.email

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # clone the proj
  def cv_project_details
    @project = Project.find(params[:proj_id])
    render json: {project: @project ,domain_id: @project.domain&.id , core_skill_id: @project.core_skill&.id , supportive_skill_ids: @project.supportive_skill_ids}  
  end

  private

  def set_project
      @project = Project.find(params[:id])
    end
    def project_params
      params.require(:project).permit(:team_size , :role ,  :title, :desc,:start_date ,:end_date, linkable_domain_attributes: [:domain_id],linkable_core_tech_attributes: [:tech_stack_id],supportive_skill_ids:[])
    end
end
