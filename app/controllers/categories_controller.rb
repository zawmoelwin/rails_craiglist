class CategoriesController < ApplicationController

  def index
    @categories=Category.all
  end

  # def new
  #
  # end

  def create
    @category = Category.new(category_params)
     if @category.save
    redirect_to @category
    else
    render plain: params[:category].inspect
    end
  end

  def show
    @category = Category.find(params[:id])
    @articles = @category.articles
  end


  private
  def category_params
    params.require(:category).permit(:name)
  end

end
