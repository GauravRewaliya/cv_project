class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :email
      # t.string :contact
      t.string :contact
      t.string :gender
      t.string :skill
      t.string :address
      # t.string :skill
      # t.references :skill, null: true, foreign_key: true
#  by def may be false
      t.references :candidate,  null: true,foreign_key: true , unique: true
      t.timestamps
    end
  end
end
