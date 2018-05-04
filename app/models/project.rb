class Project < ApplicationRecord
  has_many :project_data, dependent: :destroy
  has_many :promises, dependent: :destroy
  has_many :media, dependent: :destroy
  has_many :user_fund_projects
  has_many :wishlists
  belongs_to :user
  belongs_to :category

  def self.featured
    @projects = Project.all.limit(3)
  end

end
