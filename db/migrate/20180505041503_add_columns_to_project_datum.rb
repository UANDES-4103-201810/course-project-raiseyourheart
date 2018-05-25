class AddColumnsToProjectDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :project_data, :name, :text
  end
end
