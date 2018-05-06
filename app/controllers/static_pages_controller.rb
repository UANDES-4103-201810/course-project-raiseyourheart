class StaticPagesController < ApplicationController
  def index
    @projects = Project.featured
  end

  def about
    @team = User.admins
  end

  def contact
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    # UserMailer.contact_form(@email, @name, @message).deliver_now
  end
end
