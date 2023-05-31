class CreateLayout < ActiveRecord::Migration[7.0]
  def change
    create_table :layouts do |t|
      t.string :save_html
      t.timestamps
    end
  end
end
