class Project < ApplicationRecord
  has_many :project_data
  has_many :promises
  has_many :media
  has_many :user_fund_projects
  has_many :wishlists
  belongs_to :user


end
