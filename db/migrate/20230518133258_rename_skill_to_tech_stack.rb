class RenameSkillToTechStack < ActiveRecord::Migration[7.0]
  def change
    rename_table :skills, :tech_stacks
  end
end
