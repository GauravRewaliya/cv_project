class TechStacksController < ApplicationController
  before_action :set_tech_stack, only: %i[ show edit update destroy ]

  def index  
      @tech_stacks = TechStack.all
  end

  def show
  end

  def new
    @tech_stack = TechStack.new
  end

  
  def edit
  end

  def create
    @tech_stack = TechStack.new(tech_stack_params)

    @tech_stack.created_by = current_user.email
    @tech_stack.updated_by = current_user.email
    
    respond_to do |format|
      if @tech_stack.save
        format.html { redirect_to tech_stack_url(@tech_stack), notice: "Tech_stack was successfully created." }
        format.json { render :show, status: :created, location: @tech_stack }
        format.js
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tech_stack.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  
  def update
    @tech_stack.updated_by = current_user.email
    respond_to do |format|
      if @tech_stack.update(tech_stack_params)
        format.html { redirect_to tech_stack_url(@tech_stack), notice: "tech_stack was successfully updated." }
        format.json { render :show, status: :ok, location: @tech_stack }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tech_stack.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @tech_stack.destroy

    respond_to do |format|
      format.html { redirect_to tech_stacks_url, notice: "tech_stack was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  
    def set_tech_stack
      @tech_stack = TechStack.find(params[:id])
    end

    
    def tech_stack_params
      params.require(:tech_stack).permit( :tech_type ,:title, :desc , project_ids: [])
    end
end
