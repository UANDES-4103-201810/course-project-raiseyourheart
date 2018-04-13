class Good < ApplicationRecord
  belongs_to :promise

  validates :name, presence: true
  validates :description, length: { minimum: 25 }
end
