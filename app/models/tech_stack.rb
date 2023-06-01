class TechStack < ApplicationRecord
    has_many :project_supportive_techs , dependent: :destroy
    has_many :projects, through: :project_supportive_techs

    # belongs_to :project ,optional: true
    before_destroy :destroy_with_associations
    
  def destroy_with_associations
    # project_supportive_techs.destroy_all
    # self.projects = []
    
    ProjectCoreTech.where(tech_stack_id: self.id).destroy_all
    ProfileCoreTech.where(tech_stack_id: self.id).destroy_all
    ProfileSupportiveTech.where(tech_stack_id: self.id).destroy_all
  end

end
