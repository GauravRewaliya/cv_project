class CreateLinkableCoreTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :linkable_core_teches do |t|
      t.references :tech_stack,  foreign_key: true
      t.references :connectable, polymorphic: true

      t.timestamps
    end
  end
end
