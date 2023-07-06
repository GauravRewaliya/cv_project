class CurriculumVitae < ApplicationRecord
  validates :candidate , :template_name , presence: true
  validates :curriculum_vitae_core_tech, presence: true
  validates :projects  , presence: true
  validates :experience, numericality: {greater_than_or_equal_to: 0 ,allow_nil: true}

    belongs_to :candidate
  
     has_many :project_curriculum_vitaes ,dependent: :destroy
     has_many :projects , through: :project_curriculum_vitaes
    
    has_one_attached :image
    
    has_many :curriculum_vitae_supportive_techs ,dependent: :destroy
    has_many :supportive_skills, through: :curriculum_vitae_supportive_techs, source: :tech_stack
    
    has_one :curriculum_vitae_core_tech , dependent: :destroy
    has_one :core_skill, through: :curriculum_vitae_core_tech, source: :tech_stack 
  
  accepts_nested_attributes_for :curriculum_vitae_core_tech , reject_if: :all_blank
  
end
