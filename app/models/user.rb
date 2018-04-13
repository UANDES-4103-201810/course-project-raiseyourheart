class User < ApplicationRecord
  has_many :projects
  has_many :user_fund_projects
  has_many :user_buy_promises
end
