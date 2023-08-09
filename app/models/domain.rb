class Domain < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    before_destroy :destroy_fun
    def destroy_fun 
        LinkableDomain.where(domain_id: self.id).destroy_all
    end
end
