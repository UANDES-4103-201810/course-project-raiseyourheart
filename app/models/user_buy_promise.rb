class UserBuyPromise < ApplicationRecord
  belongs_to :user
  belongs_to :promise
end
