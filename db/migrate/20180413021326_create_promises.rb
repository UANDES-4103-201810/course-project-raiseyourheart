class CreatePromises < ActiveRecord::Migration[5.2]
  def change
    create_table :promises do |t|
      t.text :description
      t.numeric :amount
      t.date :delivery_time
      t.attachment :avatar
      t.references :user, foreign_key: true
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
