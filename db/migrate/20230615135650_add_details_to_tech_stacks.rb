class AddDetailsToTechStacks < ActiveRecord::Migration[7.0]
  def change
    add_column :tech_stacks, :tech_type, :integer
  end
end
