class Project < ApplicationRecord
    validate :date_validation
    validates :project_domain ,:start_date , presence: true
    validates :title, uniqueness: { case_sensitive: false }
    before_destroy :delete_fun

    # has_many :project_supportive_techs , dependent: :destroy
    # has_many :supportive_skills, through: :project_supportive_techs, source: :tech_stack
    
    # has_one :project_core_tech , dependent: :destroy
    # has_one :core_skill, through: :project_core_tech, source: :tech_stack   
    
    has_many :linkable_supportive_techs , as: :connectable , class_name: "LinkableSupportiveTech"
  has_many :supportive_skills, through: :linkable_supportive_techs, source: :tech_stack
  
  has_one :linkable_core_tech , as: :connectable , class_name: "LinkableCoreTech"
  has_one :core_skill, through: :linkable_core_tech, source: :tech_stack  

    has_one :project_domain , dependent: :destroy 
    has_one :domain, through: :project_domain
    
    accepts_nested_attributes_for :linkable_core_tech , reject_if: :all_blank
    accepts_nested_attributes_for :project_domain , reject_if: :all_blank

    def date_validation
        return if end_date.blank? || start_date.blank?

        if end_date < start_date
            errors.add(:end_date , "==>>starting date must start first")
        end 
    end

    def delete_fun
        ProjectCurriculumVitae.where(project_id: self.id).destroy_all
    end
           
end
