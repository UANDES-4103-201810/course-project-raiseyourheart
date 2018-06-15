class Project < ApplicationRecord
  has_many :project_data, dependent: :destroy
  has_many :promises, dependent: :destroy
  has_many :media, dependent: :destroy
  has_many :user_fund_projects, dependent: :destroy
  has_many :wishlists, dependent: :destroy
  belongs_to :user
  belongs_to :category

  def self.featured
    @projects = Project.where(featured:true).limit(3)
  end

  def self.belong_category(category)
    @projects = Project.where(category: category)
  end

  def self.user_project(user)
    @projects = Project.where(user: user)
  end

  def self.user_funds(user)
    @projects = Project.where(id: UserFundProject.where(user: user).select(:project_id))
  end

end
