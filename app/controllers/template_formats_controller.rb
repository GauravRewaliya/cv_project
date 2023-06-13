class TemplateFormatsController < ApplicationController
       before_action :set_template_format, only: %i[ show edit update destroy save_layout_data]
      #  layout false, only: [:show]
      #  layout "default", only: [:show]
        def index
          if !params['search'].blank?
            @template_formats = TemplateFormat.where('lower(name) LIKE ?' ,"%"+params['search']+"%" )
            else
              @template_formats = TemplateFormat.all
            end
        end
      
        
        def show
          # layout "application"
          
           t= ERB.new( @template_format.layout)
              # initialize variables 
            #   require 'ostruct'

            #   @curriculum_vitae  = OpenStruct.new
            #   @curriculum_vitae.candidate =OpenStruct.new
            #   @curriculum_vitae.candidate.name = "Abhishake Kumar"
              
            #   @curriculum_vitae.profile_desc ="5* hacker rank java developer, like to learn and code , got top 10 place in few competiion also  doing coding at free time , Hobby is to repair things , and do analisys that how things works , and can be modified and better"

            #   profile =OpenStruct.new
            #   profile.contact = "8889454754"
            #   profile.email = "GauravRewaliya@yahoo.com"
            #   profile.address = "xyz ,coloney"
            #   profile.gender = "male"
            #   @curriculum_vitae.candidate.profile= profile

            # # skill 

            # # core 

            # # projects 
             
             @curriculum_vitae = CurriculumVitae.first
              curriculum_vitae = @curriculum_vitae
            @res_cv_html = t.result(binding)
            
          # render layout: "default"
          render :layout => 'default'
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
      
        def view_format
          @projects  = Project.first(5)
          @template_format = TemplateFormat.find(params[:template_format_id])
          render :layout => 'cv'
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
