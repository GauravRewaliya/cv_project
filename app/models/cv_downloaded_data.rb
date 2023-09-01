class CvDownloadedData < ApplicationRecord
  belongs_to :cv , class_name: 'CurriculumVitae'

  attribute :doc_downloaded, :boolean, default: false
  attribute :pdf_downloaded, :boolean, default: false
end
