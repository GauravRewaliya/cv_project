class TechStack < ApplicationRecord

    validates :tech_type , :title, presence: true
    validates :title, uniqueness: { case_sensitive: false }
    
      has_many :linkable_core_techs
      has_many :projects, through: :linkable_core_techs, source: :connectable, source_type: 'Project'

    before_destroy :destroy_with_associations

  def destroy_with_associations
    LinkableCoreTech.where(tech_stack_id: self.id).destroy_all
    LinkableSupportiveTech.where(tech_stack_id: self.id).destroy_all

    CurriculumVitaeCoreTech.where(tech_stack_id: self.id).destroy_all  
    CurriculumVitaeSupportiveTech.where(tech_stack_id: self.id).destroy_all
    
    CandidateCoreTech.where(tech_stack_id: self.id).destroy_all  
    CandidateSupportiveTech.where(tech_stack_id: self.id).destroy_all
  end

  def  self.core_skills
   TechStack.where(tech_type: 1)
  end

  def  self.supportive_skills
    TechStack.where(tech_type: 2)
   end

end
