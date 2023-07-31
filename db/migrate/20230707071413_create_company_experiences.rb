class CreateCompanyExperiences < ActiveRecord::Migration[7.0]
  def change
    create_table :company_experiences do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.string :company_name
      # t.integer :experience
      t.date :start_date
      t.date :end_date
      t.string :role
      t.timestamps
    end
  end
end
