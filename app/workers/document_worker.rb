class DocumentWorker
    include Sidekiq::Worker
    # include WickedPdf::PdfHelper

    sidekiq_options retry: false
    sidekiq_options timeout: 60 # 60sec => 1 min
    # def get_html(curriculum_vitae)  # xxx
    #   # ac = ActionController::Base.new()
    #   # ac = ApplicationController.new
    #   ac = ActionController::Base.new
    #   ac.class.include(WickedPdf::PdfHelper)
    #   html_txt = ac.render_to_string(partial: "html_templates/#{curriculum_vitae.template_name}" , locals: { curriculum_vitae: curriculum_vitae} ,layout: false)
    #   method(:render_to_string).owner
    #   html_txt
    # end

    def perform(pour_html,cv_id)
      pdf_data = WickedPdf.new.pdf_from_string(pour_html)
      input_path = "public/temp/tempCv_#{cv_id}.pdf"
      File.open(input_path,'wb'){ |file| file << pdf_data}
      puts "pdf created for #{cv_id}"
    end
  end