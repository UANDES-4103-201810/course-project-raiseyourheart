class UserFundProject < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :amount, presence: true
  validates :amount, numericality: {greater_than_or_equal_to: 0}


  def self.amount_raised(project)
    amount_raised = UserFundProject.where(project: project).sum(:amount)
  end

  def self.validate_last_donation?(user, project)
    UserFundProject.where(user: user, project: project, email_confirmed: true).max_by(&:id).nil?
  end

  def self.last_donation_user(user, project)
    amount = UserFundProject.where(user: user, project: project, email_confirmed: true).max_by(&:id).amount
  end

  def validate_email
      self.email_confirmed = true
      self.confirm_token = nil
  end

  def set_confirmation_token
      if self.confirm_token.blank?
        self.confirm_token = SecureRandom.urlsafe_base64.to_s
      end
  end

end
