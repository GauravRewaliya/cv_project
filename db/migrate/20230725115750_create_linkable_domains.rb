class CreateLinkableDomains < ActiveRecord::Migration[7.0]
  def change
    create_table :linkable_domains do |t|
      t.references :domain, null: false, foreign_key: true
      t.references :connectable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
