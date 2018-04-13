class Category < ApplicationRecord
  has_many :projects

  validates :description, :name, presence: true
  validates :description, length: {minimum: 35}

end
