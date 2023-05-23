class ProjectTechStack < ApplicationRecord
  belongs_to :project
  belongs_to :tech_stack
end
