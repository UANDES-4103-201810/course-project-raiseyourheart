class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.datetime :login
      t.string :first
      t.string :last
      t.boolean :admin, default:false
      t.string :phone
      t.text :description
      t.attachment :avatar
      t.date :birthdate
      t.string :gender

      t.timestamps
    end
  end
end
