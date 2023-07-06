class CreateCurriculumVitaeCoreTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :curriculum_vitae_core_teches do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :tech_stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
