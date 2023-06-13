class AddDetailsToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :created_by, :string
    add_column :projects, :updated_by, :string
  end
end
