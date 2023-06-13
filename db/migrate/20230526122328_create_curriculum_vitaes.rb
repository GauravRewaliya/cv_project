class CreateCurriculumVitaes < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculum_vitaes do |t|
      t.integer "experience"
      t.timestamps
    end
  end
end
