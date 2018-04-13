class CreateMedia < ActiveRecord::Migration[5.2]
  def change
    create_table :media do |t|
      t.references :project, foreign_key: true
      t.string :type
      t.string :path, default:""

      t.timestamps
    end
  end
end
