class Project < ApplicationRecord
    has_many :project_tech_stacks
    has_many :tech_stacks, through: :project_tech_stacks  # supportive skill

    # has_one :tech_stack , class_name: 'SupportiveSkill'
    # has_one :core_skill, class_name: 'TechStack'  # need belongs_to in another table , they only link one

    # 
    # belongs_to :core_skill, class_name: "TechStack" # there is no need to dec has_many proj in skills
        #belongs_to .. nedd to add ref
                                # alias problem....  >> sol >> add_reference :projects, :core_skill, foreign_key: { to_table: :tech_stacks }


        belongs_to :tech_stack , optional: true
        alias_attribute :core_skill, :tech_stack


        # use belongs to /or// has_one through.. bec else ,, another table only link with one

end
