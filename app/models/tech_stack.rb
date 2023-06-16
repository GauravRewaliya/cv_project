class TechStack < ApplicationRecord

    validates :tech_type , :title, presence: true

      has_many :project_core_techs
      has_many :projects, through: :project_core_techs
    before_destroy :destroy_with_associations

  def destroy_with_associations
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
