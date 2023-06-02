class CvTemplate < ApplicationRecord
  belongs_to :curriculum_vitae  #handle
  belongs_to :template_format
end
