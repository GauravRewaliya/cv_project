class Project < ApplicationRecord
    before_destroy :delete_fun
    has_many :project_supportive_techs , dependent: :destroy
    has_many :supportive_skills, through: :project_supportive_techs, source: :tech_stack
    
    has_one :project_core_tech , dependent: :destroy
    has_one :core_skill, through: :project_core_tech, source: :tech_stack   # rename actual table
                                                                    # dependent dest not work on through
    accepts_nested_attributes_for :project_core_tech , reject_if: :all_blank#:reject_core_skill_blank
    
    #domain
    has_one :project_domain , dependent: :destroy  # destroy 3rd table
    has_one :domain, through: :project_domain

    accepts_nested_attributes_for :project_domain , reject_if: :all_blank

    # def reject_core_skill_blank(attributes)
    #     attributes['tech_stack_id'].blank?
    # end

    # validates_comparison_of :end_date, greater_than_or_equal_to: :start_date , format: { message: 'must be valid date'}
    
    validate :date_validation
    def date_validation
        return if end_date.blank? || start_date.blank?

        if end_date < start_date
            errors.add(:end_date , "==>>starting date must start first")
        end 
    end

    def delete_fun
        ProjectCurriculumVitae.where(project_id: self.id).destroy_all
    end
    
    # has_many :project_tech_stacks
    # has_many :tech_stacks, through: :project_tech_stacks  # supportive skill
    # has_many :supportive_skills, through: :project_tech_stacks, source: :tech_stack


    # has_one :tech_stack , class_name: 'SupportiveSkill'
    # has_one :core_skill, class_name: 'TechStack'  # need belongs_to in another table , they only link one

    # 
    # belongs_to :core_skill, class_name: "TechStack" # there is no need to dec has_many proj in skills
        #belongs_to .. nedd to add ref
                                # alias problem....  >> sol >> add_reference :projects, :core_skill, foreign_key: { to_table: :tech_stacks }


        # belongs_to :tech_stack , optional: true
        # alias_attribute :core_skill, :tech_stack
            # want has_one through:
           
#     before_destroy :destroy_core_skill
#     private
#   def destroy_core_skill
#     core_skill.destroy if core_skill.present?
#   end

            # has_one :profile , dependent: :destroy

        # use belongs to /or// has_one through.. bec else ,, another table only link with one
           
end
