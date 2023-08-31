class CurriculumVitae < ApplicationRecord
  validates :candidate , :template_name , presence: true
  validates :linkable_core_tech, presence: true
  validates :experience, numericality: {greater_than_or_equal_to: 0 ,allow_nil: true}
  before_destroy :delete_fun
    
    belongs_to :candidate

    has_many :cv_projects , dependent: :destroy
    
    has_one_attached :image , dependent: :destroy
    
    has_many :linkable_supportive_techs , as: :connectable , class_name: "LinkableSupportiveTech" , dependent: :destroy
    has_many :supportive_skills, through: :linkable_supportive_techs, source: :tech_stack
    
    has_one :linkable_core_tech , as: :connectable , class_name: "LinkableCoreTech" , dependent: :destroy
    has_one :core_skill, through: :linkable_core_tech, source: :tech_stack   
   
    has_many :company_experiences ,dependent: :destroy
    has_one :cv_downloaded_data, foreign_key: :cv_id , dependent: :destroy
    accepts_nested_attributes_for :company_experiences , allow_destroy: true , reject_if: :all_blank
    accepts_nested_attributes_for :cv_projects , allow_destroy: true , reject_if: :all_blank

    accepts_nested_attributes_for :linkable_core_tech , reject_if: :all_blank

    def delete_fun
      CvProject.where(curriculum_vitae_id: self.id).destroy_all
      CompanyExperience.where(curriculum_vitae_id: self.id).destroy_all

      # ProjectCurriculumVitae.where(curriculum_vitae_id: self.id).destroy_all
    end
  
end
