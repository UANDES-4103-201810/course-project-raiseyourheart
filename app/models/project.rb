class Project < ApplicationRecord
  has_many :project_data, dependent: :destroy
  has_many :promises, dependent: :destroy
  has_many :media, dependent: :destroy
  has_many :user_fund_projects
  has_many :wishlists
  belongs_to :user


end
