class CreateProjectCurriculumVitaes < ActiveRecord::Migration[7.0]
  def change
    create_table :project_curriculum_vitaes do |t|
      t.references :project, null: false, foreign_key: true
      t.references :curriculum_vitae, null: false, foreign_key: true

      t.timestamps
    end
  end
end
