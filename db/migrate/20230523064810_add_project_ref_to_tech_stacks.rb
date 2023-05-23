class AddProjectRefToTechStacks < ActiveRecord::Migration[7.0]
  def change
    # add_reference :tech_stacks, :project, null: false, foreign_key: true , unique: true
    # add_reference :tech_stacks, :project, null: true ,foreign_key: true , unique: true
  end
end
