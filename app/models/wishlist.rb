class Wishlist < ApplicationRecord
  belongs_to :user
  belongs_to :project

  def self.user_wishlist?(user, project)
    Wishlist.where(user: user, project: project).blank?
  end
  def self.wishlist(user,project)
    Wishlist.find_by(user: user, project: project)
  end
  def self.get_user_wishlist(user)
    @wishlists=Wishlist.where(user: user)
  end
end
