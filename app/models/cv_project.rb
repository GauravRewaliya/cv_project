class CvProject < ApplicationRecord
  validates :title ,:desc , :role ,:team_size , :start_date ,:proj_core_skill , presence: true
  
  belongs_to :curriculum_vitae
  belongs_to :original_project , class_name: 'Project' ,optional: true

  #  Project.last.attributes.except("id","created_at","updated_at","created_by","updated_by")   \\\\

  has_many :linkable_supportive_techs , as: :connectable , class_name: "LinkableSupportiveTech"
  has_many :proj_supportive_skills, through: :linkable_supportive_techs, source: :tech_stack
  
  has_one :linkable_core_tech , as: :connectable , class_name: "LinkableCoreTech"
  has_one :proj_core_skill, through: :linkable_core_tech, source: :tech_stack   
  
  # has_one :domain, through: :project_domain
  
  accepts_nested_attributes_for :linkable_core_tech , reject_if: :all_blank
  accepts_nested_attributes_for :proj_supportive_skills , reject_if: :all_blank

  def proj_core_skill_id
    self.proj_core_skill&.id
  end

  def proj_core_skill_id=(value)
    if !value.blank?
      self.proj_core_skill = TechStack.find(value)
    else 
      self.proj_core_skill = nil
    end
  end
end
