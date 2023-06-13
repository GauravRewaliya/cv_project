class CreateProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :projects do |t|
      t.string :title
      t.text :desc
      t.date :start_date
      t.date :end_date
      t.integer :team_size
      t.text :role
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
