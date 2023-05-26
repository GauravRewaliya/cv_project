class CurriculumVitae < ApplicationRecord
    has_many :project_curriculum_vitaes
    has_many :projects , through: :project_curriculum_vitaes

    has_one :candidate_curriculum_vitae
    has_one :candidate , through: :candidate_curriculum_vitae
end
