class TechStack < ApplicationRecord

    validates :tech_type , :title, presence: true

  
    # has_many :project_supportive_techs , dependent: :destroy
    # has_many :projects, through: :project_supportive_techs
      has_many :project_core_techs
      has_many :projects, through: :project_core_techs
    # belongs_to :project ,optional: true
    before_destroy :destroy_with_associations
    







  def destroy_with_associations
    # project_supportive_techs.destroy_all
    # self.projects = []
    
    ProjectCoreTech.where(tech_stack_id: self.id).destroy_all
    ProfileCoreTech.where(tech_stack_id: self.id).destroy_all
    ProfileSupportiveTech.where(tech_stack_id: self.id).destroy_all
  end


  def  self.core_skills
   TechStack.where(tech_type: 1)
  end

  def  self.supportive_skills
    TechStack.where(tech_type: 2)
   end


end
