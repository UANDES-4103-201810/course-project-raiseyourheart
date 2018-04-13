class CreateUserBuyPromises < ActiveRecord::Migration[5.2]
  def change
    create_table :user_buy_promises do |t|
      t.references :user, foreign_key: true
      t.references :promise, foreign_key: true

      t.timestamps
    end
  end
end
