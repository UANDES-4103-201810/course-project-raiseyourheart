class Promise < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :goods, dependent: :destroy
  validates :description, :delivery_time, :amount, presence: true
  validates :description, length: {minimum: 35}
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
