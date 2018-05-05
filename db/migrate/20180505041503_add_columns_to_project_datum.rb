class AddColumnsToProjectDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :project_data, :name, :text
    add_column :project_data, :avatar_file_name, :string, default:"placeholder.png"
  end
end
