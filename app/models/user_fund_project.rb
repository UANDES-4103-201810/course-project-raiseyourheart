class UserFundProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}


  def self.amount_raised(project)
    amount_raised = UserFundProject.where(project: project).sum(:amount)
  end


end
