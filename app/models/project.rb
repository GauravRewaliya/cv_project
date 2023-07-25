class Project < ApplicationRecord
    validate :date_validation
    validates :project_domain ,:start_date ,:title , presence: true
    validates :desc,:linkable_core_tech , presence: true
    validates :title, uniqueness: { case_sensitive: false }
    before_destroy :delete_fun

    has_many :linkable_supportive_techs , as: :connectable , class_name: "LinkableSupportiveTech" , dependent: :destroy
    has_many :supportive_skills, through: :linkable_supportive_techs, source: :tech_stack
  
    has_one :linkable_core_tech , as: :connectable , class_name: "LinkableCoreTech" , dependent: :destroy
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
        CvProject.where(original_project_id: self.id).each  do |cv_project|
            cv_project.update(original_project_id: nil)
            cv_project.save
        end
    end
           
end
