class WishlistsController < ApplicationController

  def create
    wishlist_params={}
    wishlist_params[:project]=Project.find(params[:project])
    wishlist_params[:user]=current_user
    @wishlist = Wishlist.new(wishlist_params)
    if @wishlist.save
      redirect_to @wishlist.project, notice: "Added to wishlist."
    else
      redirect_to @project, alert: "Error: Couldn't add project to wishlist"
    end
  end

  def destroy
    @wishlist= Wishlist.find(params[:id])
    @user=@wishlist.user
    @project=@wishlist.project
    @wishlist.destroy
    if params[:user]
      redirect_to @user, notice: "Removed from wishlist."
    else
      redirect_to @project, notice: "Removed from wishlist."
    end


  end

end
