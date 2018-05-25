class AddAbstractToProjectDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :project_data, :abstract, :text
  end
end
