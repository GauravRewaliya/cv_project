class CreateTechStacks < ActiveRecord::Migration[7.0]
  def change
    create_table :tech_stacks do |t|
      t.string :title
      t.text :desc
      t.integer :tech_type
      t.timestamps
    end
  end
end
