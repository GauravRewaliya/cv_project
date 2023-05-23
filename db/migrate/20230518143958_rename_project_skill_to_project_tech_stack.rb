class RenameProjectSkillToProjectTechStack < ActiveRecord::Migration[7.0]
  def change
    rename_table :project_skills, :project_tech_stacks
  end
end
