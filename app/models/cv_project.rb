class CvProject < ApplicationRecord
  belongs_to :curriculum_vitae
  belongs_to :original_project , class_name: 'Project'

  #  Project.last.attributes.except("id","created_at","updated_at","created_by","updated_by")   \\\\

  # has_many :project_supportive_techs , dependent: :destroy
  # has_many :supportive_skills, through: :project_supportive_techs, source: :tech_stack
  
  # has_one :project_core_tech , dependent: :destroy
  # has_one :core_skill, through: :project_core_tech, source: :tech_stack   
  
  # has_one :project_domain , dependent: :destroy 
  # has_one :domain, through: :project_domain
  
  # accepts_nested_attributes_for :project_core_tech , reject_if: :all_blank
  # accepts_nested_attributes_for :project_domain , reject_if: :all_blank
end
