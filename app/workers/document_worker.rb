class DocumentWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options timeout: 60 # 60sec => 1 min
    def perform(pour_html,cv_id)
      pdf_data = WickedPdf.new.pdf_from_string(pour_html)
      input_path = "public/temp/tempCv_#{cv_id}.pdf"
      File.open(input_path,'wb'){ |file| file << pdf_data}
      puts "pdf created for #{cv_id}"
    end
  end