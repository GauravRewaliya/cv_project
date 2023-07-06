class CreateDomains < ActiveRecord::Migration[7.0]
  def change
    create_table :domains do |t|
      t.string :title
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
  end
end
