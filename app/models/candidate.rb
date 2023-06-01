class Candidate < ApplicationRecord
    has_one :profile , dependent: :destroy
    accepts_nested_attributes_for :profile

    before_destroy :delete_fun
    def delete_fun
        CandidateCurriculumVitae.where( candidate_id: self.id).destroy_all
    end
end
