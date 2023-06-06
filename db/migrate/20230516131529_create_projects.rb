class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.date :start_date
      t.date :end_date
      # t.references :tech_stack ,foreign_key: true 
      # t.references :core_skill, null: true, foreign_key: { to_table: :tech_stacks }
        # t.references :core_skill, null: true, foreign_key: { to_table: :tech_stacks }
        #belongs to.. 
      t.timestamps
    end
  end
end
