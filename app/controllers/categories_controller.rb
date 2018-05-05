class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @projects = Project.belong_category(@category)
  end
end
