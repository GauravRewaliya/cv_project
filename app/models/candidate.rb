class Candidate < ApplicationRecord
    validates :name , :employ_id , presence: true
            # profile got no effect
    before_destroy :delete_fun

    has_one :profile , dependent: :destroy

    has_many :curriculum_vitaes    #has_many belongs to
    
    accepts_nested_attributes_for :profile
    
    def delete_fun
        #destroy all cvs related to candidate
        a_ids = self.curriculum_vitae_ids
        CurriculumVitae.destroy(a_ids)
    end
end
