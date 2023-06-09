class TemplateFormatsController < ApplicationController
        before_action :set_template_format, only: %i[ show edit update destroy save_layout_data]
      
        def index
          if !params['search'].blank?
            @template_formats = TemplateFormat.where('lower(name) LIKE ?' ,"%"+params['search']+"%" )
            else
              @template_formats = TemplateFormat.all
            end
        end
      
        
        def show
          # @resume_html = render_to_string(partial: 'layout' , locals: { template_format: @template_format})
        end
      
        
        def new
          @template_format = TemplateFormat.new
        end
      
        
        def edit
        end
      
        
        def create
      
          @template_format = TemplateFormat.new(template_format_params)

          respond_to do |format|
            if @template_format.save
              format.html { redirect_to template_format_url(@template_format), notice: "TemplateFormat was successfully created." }
              format.json { render :show, status: :created, location: @template_format }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @template_format.errors, status: :unprocessable_entity }
            end
          end
        end
      
        
        def update

          respond_to do |format|
            if @template_format.update(template_format_params)
              format.html { redirect_to template_format_url(@template_format), notice: "TemplateFormat was successfully updated." }
              format.json { render :show, status: :ok, location: @template_format }
            else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @template_format.errors, status: :unprocessable_entity }
            end
          end
        end
      
        
        def destroy
          @template_format.destroy
          respond_to do |format|
            format.html { redirect_to template_formats_url, notice: "TemplateFormat was successfully destroyed." }
            format.json { head :no_content }
          end
        end
        private
        
          def set_template_format
            @template_format = TemplateFormat.find(params[:id])
          end
      
          
          def template_format_params
            params.require(:template_format).permit(:name , :layout)                                                                                #  template_format_core_tech me tech_stack_id lega
          end
end
