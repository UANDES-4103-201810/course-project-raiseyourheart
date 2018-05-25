class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.references :user, foreign_key: true
      # t.references :category, foreign_key: true
      t.boolean :featured, default: false
      t.timestamps
    end
  end
end
