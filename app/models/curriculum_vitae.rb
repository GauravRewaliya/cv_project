class CurriculumVitae < ApplicationRecord
    has_many :project_curriculum_vitaes ,dependent: :destroy
    has_many :projects , through: :project_curriculum_vitaes

    has_one :candidate_curriculum_vitae , dependent: :destroy
    has_one :candidate , through: :candidate_curriculum_vitae
    
    has_one :template_format
  accepts_nested_attributes_for :template_format , reject_if: :all_blank
end
