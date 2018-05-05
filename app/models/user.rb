class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :projects, dependent: :destroy
  # has_many :project_data, through: :projects
  has_many :user_fund_projects
  has_many :user_buy_promises
  has_many :wishlists, dependent: :destroy

  # validates :phone, length:  {minimum: 9, maximum: 12}
  # validates :password, length: {minimum: 8, maximum: 12}
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email address" }


  def self.member_since(user)
    user.created_at.year
  end



end
