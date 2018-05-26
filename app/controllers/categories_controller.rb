class CategoriesController < ApplicationController
  def show
    @category=Category.find(params[:id])
    @projects = Project.belong_category(@category)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to @category, notice: "Category created successfully."
    else
      redirect_to categories_path, alert: "Unable to create category."
    end
    # end
  end

  private
      def category_params
        params.require(:category).permit(:name, :description)
      end
end
