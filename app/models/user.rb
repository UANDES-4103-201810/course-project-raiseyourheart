class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]
  has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100>"}, default_url: "placeholder-user.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :projects, dependent: :destroy
  has_many :promises, dependent: :destroy
  # has_many :project_data, through: :projects
  has_many :user_fund_projects, dependent: :destroy
  has_many :user_buy_promises, dependent: :destroy
  has_many :wishlists, dependent: :destroy

  # validates :phone, length:  {minimum: 9, maximum: 12}
  # validates :password, length: {minimum: 8, maximum: 12}
  # validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/, message: "invalid email address" }

  def self.from_omniauth(auth)
    where( provider: auth.provider , uid: auth.uid ).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first = auth.info.first_name
      user.last = auth.info.last_name
      user.password = Devise.friendly_token[0, 20]
    end
  end


  def self.member_since(user)
    user.created_at.year
  end

  def self.admins
    admins = User.where(admin:true)
  end

  def self.user_funds(project)
    @users = User.where(id: UserFundProject.where(project: project).select(:user_id)).limit(5)
  end



end
