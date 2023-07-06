class CreateCvTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :cv_templates do |t|
      t.references :curriculum_vitae, null: false, foreign_key: true
      t.references :template_format, null: false, foreign_key: true

      t.timestamps
    end
  end
end
