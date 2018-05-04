class StaticPagesController < ApplicationController
  def index
    @projects = Project.featured
  end

  def about
  end

  def contact
  end
end
