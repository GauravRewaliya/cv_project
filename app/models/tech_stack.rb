class TechStack < ApplicationRecord
    has_many :project_supportive_techs
    has_many :projects, through: :project_supportive_techs

    # belongs_to :project ,optional: true
    before_destroy :destroy_with_associations
  def destroy_with_associations
    # project_supportive_techs.destroy_all
    
    ProjectCoreTech.where(tech_stack_id: self.id).destroy_all
    destroy
  end

end
