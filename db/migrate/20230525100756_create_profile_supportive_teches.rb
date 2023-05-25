class CreateProfileSupportiveTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :profile_supportive_teches do |t|
      t.references :profile, null: false, foreign_key: true
      t.references :tech_stack, null: false, foreign_key: true

      t.timestamps
    end
  end
end
