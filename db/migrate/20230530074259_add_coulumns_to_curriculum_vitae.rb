class AddCoulumnsToCurriculumVitae < ActiveRecord::Migration[7.0]
  def change
    add_column :curriculum_vitaes, :objective, :string
    add_column :curriculum_vitaes, :profile_desc, :string
  end
end
