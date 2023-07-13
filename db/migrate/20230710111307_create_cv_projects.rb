class CreateCvProjects < ActiveRecord::Migration[7.0]
  def change
    create_table :cv_projects do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :original_project, null: false, foreign_key: { to_table: :projects } # need null : true
      t.string :title
      t.text :desc
      t.date :start_date
      t.date :end_date
      t.integer :team_size
      # t.text :role
      t.timestamps
    end
  end
end
