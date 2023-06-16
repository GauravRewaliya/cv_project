class CvTemplate < ApplicationRecord
  belongs_to :curriculum_vitae 
  belongs_to :template_format
end
