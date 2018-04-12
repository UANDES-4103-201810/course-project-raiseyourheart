class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.DateTime :login
      t.string :first
      t.string :last
      t.string :password
      t.string :email
      t.string :role
      t.string :phone
      t.text :description
      t.string :avatar_file_name
      t.Date :birthdate
      t.string :gender

      t.timestamps
    end
  end
end
