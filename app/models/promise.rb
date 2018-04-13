class Promise < ApplicationRecord
  belongs_to :user
  belongs_to :project
  has_many :goods
end
