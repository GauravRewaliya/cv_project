class AddDetailsToCurriculumVitaes < ActiveRecord::Migration[7.0]
  def change
    add_column :curriculum_vitaes, :template_name, :string
  end
end
