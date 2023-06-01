class TemplatesController < ApplicationController
        before_action :set_template, only: %i[ show edit update destroy save_layout_data]
      
        def index
          @templates = Template.all
        end
      
        
        def show
          # @resume_html = render_to_string(partial: 'layout' , locals: { template: @template})
        end
      
        
        def new
          @template = Template.new
        end
      
        
        def edit
        end
      
        
        def create
      
          @template = Template.new(template_params)

          respond_to do |format|
            if @template.save
              format.html { redirect_to template_url(@template), notice: "Template was successfully created." }
              format.json { render :show, status: :created, location: @template }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @template.errors, status: :unprocessable_entity }
            end
          end
        end
      
        
        def update

          respond_to do |format|
            if @template.update(template_params)
              format.html { redirect_to template_url(@template), notice: "Template was successfully updated." }
              format.json { render :show, status: :ok, location: @template }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @template.errors, status: :unprocessable_entity }
            end
          end
        end
      
        
        def destroy
          @template.destroy
          respond_to do |format|
            format.html { redirect_to templates_url, notice: "Template was successfully destroyed." }
            format.json { head :no_content }
          end
        end
        private
        
          def set_template
            @template = Template.find(params[:id])
          end
      
          
          def template_params
            params.require(:template).permit(:name , :layout)                                                                                #  template_core_tech me tech_stack_id lega
          end
end
