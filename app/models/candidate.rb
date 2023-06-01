class Candidate < ApplicationRecord
    has_one :profile , dependent: :destroy
    accepts_nested_attributes_for :profile
    #cand hasmany cv so i delete cv releted to it
    has_many :candidate_curriculum_vitaes 
    has_many :curriculum_vitaes , through: :candidate_curriculum_vitaes 
    before_destroy :delete_fun
    def delete_fun
        #destroy all cvs related to candidate
        a_ids = self.curriculum_vitae_ids
        CurriculumVitae.destroy(a_ids)
    end
    # def delete_fun
        # self.curriculum_vitaes.destroy_all
        # candidate_curriculum_vitaes.each do |ccv|
        #     ccv.curriculum_vitae.destroy
        #     ccv.destroy
        #   end
        #   curriculum_vitaes.each(&:destroy)
        # CandidateCurriculumVitae.where( candidate_id: self.id).destroy_all
    # end
end
