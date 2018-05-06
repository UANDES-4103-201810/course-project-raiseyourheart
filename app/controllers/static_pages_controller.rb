class StaticPagesController < ApplicationController
  def index
    @projects = Project.featured
  end

  def about
    @team = User.admins
  end

  def contact
  end
end
