class AddEmailConfirmedAndConfirmTokenToUserBuyPromise < ActiveRecord::Migration[5.2]
  def change
    add_column :user_buy_promises, :email_confirmed, :boolean, :default => false
    add_column :user_buy_promises, :confirm_token, :string
  end
end
