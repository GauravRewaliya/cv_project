class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

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
    # a = project_params
    # project_params[:tech_stack_ids] = project_params[:tech_stack_ids].reject(&:empty?)
    @project = Project.new(project_params)
    # @project.core_skill = TechStack.find_by(id: params[:core_skill_id])
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
    #  need to managed...

    # a = project_params
    # project_params[:tech_stack_ids] = project_params[:tech_stack_ids].reject(&:empty?)


    respond_to do |format|
      if @project.update(project_params)
        #  @project.core_skill = TechStack.find_by(id: params[:core_skill_id])
        #  @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.supportive_skills = []
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_project
      @project = Project.find(params[:id])
    end

    # def project_params
    #   params.require(:project).permit(:title, :desc,supportive_skill_ids:[])
    # end
    def project_params
      params.require(:project).permit(:title, :desc, core_skill_attributes: [:id],supportive_skill_ids:[])
    end
end
