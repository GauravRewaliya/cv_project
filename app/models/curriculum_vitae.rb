class CurriculumVitae < ApplicationRecord
  validates :candidate , :template_name , presence: true
  validates :curriculum_vitae_core_tech, presence: true
  validates :experience, numericality: {greater_than_or_equal_to: 0 ,allow_nil: true}
  before_destroy :delete_fun
    belongs_to :candidate
    
    #  has_many :project_curriculum_vitaes ,dependent: :destroy  #xxxx remain
    #  has_many :projects , through: :project_curriculum_vitaes
   
    has_many :cv_projects , dependent: :destroy
    
    # has_one_attached :image 
    has_one_attached :image , dependent: :destroy
    
    has_many :curriculum_vitae_supportive_techs ,dependent: :destroy
    has_many :supportive_skills, through: :curriculum_vitae_supportive_techs, source: :tech_stack
    
    has_one :curriculum_vitae_core_tech , dependent: :destroy
    has_one :core_skill, through: :curriculum_vitae_core_tech, source: :tech_stack 

    has_many :company_experiences ,dependent: :destroy
    
    accepts_nested_attributes_for :company_experiences , allow_destroy: true , reject_if: :all_blank
    accepts_nested_attributes_for :cv_projects , allow_destroy: true , reject_if: :all_blank

    accepts_nested_attributes_for :curriculum_vitae_core_tech , reject_if: :all_blank

    def delete_fun
      CurriculumVitaeCoreTech.where(curriculum_vitae: self.id).destroy_all
      CvProject.where(curriculum_vitae_id: self.id).destroy_all
      CompanyExperience.where(curriculum_vitae_id: self.id).destroy_all

      ProjectCurriculumVitae.where(curriculum_vitae_id: self.id).destroy_all
    end
  
end
