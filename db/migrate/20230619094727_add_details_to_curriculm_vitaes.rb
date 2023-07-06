class AddDetailsToCurriculmVitaes < ActiveRecord::Migration[7.0]
  def change
    # add_reference :curriculum_vitaes, :candidate, null: false, foreign_key: true
    add_reference :curriculum_vitaes, :candidate, foreign_key: true
  end
end
