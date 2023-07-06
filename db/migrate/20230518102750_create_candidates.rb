class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :employ_id
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
