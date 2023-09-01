class PdfDocWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    # sidekiq_options timeout: 60 # 60sec => 1 min
    def perform(pour_html,cv_id)
      download_cache = CvDownloadedData.find_or_initialize_by(cv_id: cv_id)
      output_path = "public/temp/tempCv_#{cv_id}.pdf"
      if download_cache.pdf_downloaded.blank? || !File::exist?(output_path)
        pdf_data = WickedPdf.new.pdf_from_string(pour_html)
        input_path = "public/temp/tempCv_#{cv_id}.pdf"   # temp file must present..
        File.open(input_path,'wb'){ |file| file << pdf_data}
      end 
      system(" lowriter --headless --infilter='writer_pdf_import' --convert-to doc:'MS Word 97' public/temp/tempCv_#{cv_id}.pdf --outdir public/temp")
      puts "pdf and doc created for #{cv_id}"
      download_cache.update(pdf_downloaded: true, doc_downloaded: true)
      download_cache.save
    end
  end