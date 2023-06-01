class CreateTemplateFormats < ActiveRecord::Migration[7.0]
  def change
    create_table :template_formats do |t|
      t.string :name
      t.text :layout
      t.references :curriculum_vitae
      t.timestamps
    end
  end
end
