class ProjectSupportiveTech < ApplicationRecord
  self.table_name = "project_supportive_techs"
  belongs_to :project
  belongs_to :tech_stack
end
