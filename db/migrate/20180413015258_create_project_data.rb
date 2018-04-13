class CreateProjectData < ActiveRecord::Migration[5.2]
  def change
    create_table :project_data do |t|
      t.numeric :amount_raised, default: 0
      t.boolean :visible, default: false
      t.numeric :goal, default: 0
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
