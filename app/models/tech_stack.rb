class TechStack < ApplicationRecord
    has_many :project_tech_stacks
    has_many :projects, through: :project_tech_stacks

    # belongs_to :project ,optional: true
end
