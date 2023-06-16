class DomainsController < ApplicationController
  before_action :set_domain, only: %i[ show edit update destroy ]

  def index
    if !params['search'].blank?
      @domains = Domain.where('lower(title) LIKE ?' ,"%"+params['search']+"%" )
      else
    @domains = Domain.all
      end
  end
  def show
  end

  def new
    @domain = Domain.new
  end

  def edit
  end

  def create
    @domain = Domain.new(domain_params)
    respond_to do |format|
      if @domain.save
        format.html {redirect_to domains_path, notice: "Domain was successfully created." }
        format.json { render :index, status: :created, location: @domain }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
       if @domain.update(domain_params)
        format.html { redirect_to domains_path, notice: "Domain was successfully updated." }
        # format.json { render :index, status: :ok, location: @domain }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @domain.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @domain.destroy

    respond_to do |format|
      format.html { redirect_to domains_url, notice: "Domain was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_domain
      @domain = Domain.find(params[:id])
    end
    
    def domain_params
      params.require(:domain).permit(:title, :desc,:start_date ,:end_date, domain_core_tech_attributes: [:tech_stack_id],supportive_skill_ids:[])
    end
end
