class DocWorker
    include Sidekiq::Worker
    sidekiq_options retry: false
    sidekiq_options timeout: 60 # 60sec => 1 min
    def perform(cv_id)
        download_cache = CvDownloadedData.find_or_initialize_by(cv_id: cv_id)
        # over write always
        system(" lowriter --headless --infilter='writer_pdf_import' --convert-to doc:'MS Word 97' public/temp/tempCv_#{cv_id}.pdf --outdir public/temp")
        download_cache.update(doc_downloaded: true)
        download_cache.save
    end
  end