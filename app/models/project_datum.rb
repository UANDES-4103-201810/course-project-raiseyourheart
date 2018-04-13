class ProjectDatum < ApplicationRecord
  belongs_to :project

  validates :amount_raised, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :goal, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :description, length: { minimum: 50 }
  validates :deadline, :estimated_delivery_time, presence: true
end
