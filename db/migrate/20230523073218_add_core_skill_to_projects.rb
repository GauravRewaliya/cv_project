class AddCoreSkillToProjects < ActiveRecord::Migration[7.0]
  def change
    add_reference :projects, :tech_stack, null: true, foreign_key: true
    # it create tech_stack_id as fkey
    #  add_reference :projects, :core_skill, foreign_key: { to_table: :tech_stacks }
  end
end
