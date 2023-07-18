class Candidate < ApplicationRecord
    validates :name , :employ_id , presence: true
    before_destroy :delete_fun
    
    has_one :profile , dependent: :destroy
    has_many :curriculum_vitaes   

    has_many :candidate_supportive_techs ,dependent: :destroy
    has_many :supportive_techs , through: :candidate_supportive_techs, source: :tech_stack
    
    has_one :candidate_core_tech,dependent: :destroy
    has_one :core_tech , through: :candidate_core_tech, source: :tech_stack
    
    accepts_nested_attributes_for :profile
    accepts_nested_attributes_for :candidate_core_tech , reject_if: :all_blank
    
    def delete_fun
        a_ids = self.curriculum_vitae_ids
        CurriculumVitae.destroy(a_ids)
    end
end
