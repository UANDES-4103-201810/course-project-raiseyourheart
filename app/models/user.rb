class User < ApplicationRecord
  has_many :projects
  has_many :user_fund_projects
  has_many :user_buy_promises
  has_many :wishlists

  validates :phone, length:  {minimum: 9, maximum: 12}
  validates :password, length: {minimum: 8, maximum: 12}
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email address" }
end
