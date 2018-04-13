class CreateProjectData < ActiveRecord::Migration[5.2]
  def change
    create_table :project_data do |t|
      t.numeric :amount_raised
      t.boolean :visible
      t.numeric :goal
      t.string :category
      t.date :deadline
      t.date :estimated_delivery_time
      t.text :description
      t.references :project, foreign_key: true
      t.string :website

      t.timestamps
    end
  end
end
