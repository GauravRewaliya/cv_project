class CreateCandidateCoreTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :candidate_core_teches do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :tech_stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
