class Candidate < ApplicationRecord
    validates :name , :employ_id , presence: true
    before_destroy :delete_fun
    
    has_one :profile , dependent: :destroy
    has_many :curriculum_vitaes   
    
    accepts_nested_attributes_for :profile
    
    def delete_fun
        a_ids = self.curriculum_vitae_ids
        CurriculumVitae.destroy(a_ids)
    end
end
