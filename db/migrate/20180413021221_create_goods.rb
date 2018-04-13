class CreateGoods < ActiveRecord::Migration[5.2]
  def change
    create_table :goods do |t|
      t.text :description
      t.string :name
      t.references :promise, foreign_key: true

      t.timestamps
    end
  end
end
