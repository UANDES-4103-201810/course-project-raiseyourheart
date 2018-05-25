class Promise < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :goods, dependent: :destroy
  has_attached_file :avatar, styles: {medium: "50x50>", thumb: "10x10>"}, default_url: "placeholderimg.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/


  validates :description, :delivery_time, :amount, presence: true
  validates :description, length: {minimum: 35}
  validates :amount, numericality: {greater_than_or_equal_to: 0}
end
