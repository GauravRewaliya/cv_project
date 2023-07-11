class CreateLinkableSupportiveTeches < ActiveRecord::Migration[7.0]
  def change
    create_table :linkable_supportive_teches do |t|
      t.references :tech_stack, foreign_key: true
      t.references :connectable, polymorphic: true
          # cant define foraign key to polymorphic
      t.timestamps
    end
  end
end
