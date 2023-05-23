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
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @project.tech_stacks = []
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

    def project_params
      params.require(:project).permit(:title, :desc, :tech_stack_id ,tech_stack_ids:[])
    end
end
