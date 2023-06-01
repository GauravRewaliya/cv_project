class CurriculumVitae < ApplicationRecord
    has_many :project_curriculum_vitaes ,dependent: :destroy
    has_many :projects , through: :project_curriculum_vitaes

    has_one :candidate_curriculum_vitae , dependent: :destroy
    has_one :candidate , through: :candidate_curriculum_vitae
    
    before_destroy :delete_fun
    def delete_fun
    # self.candidate =nil 
    # self.project_ids = [] 
    end
end
