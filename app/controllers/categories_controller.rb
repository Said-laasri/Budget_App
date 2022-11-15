class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
  end

  def new
    @category = Categorie.new
  end

  def show
    @category = Categorie.find(params[:id])
  end

  def create
    @category = Categorie.new(category_params)
    if @category.save
      flash[:success] = 'Category created'
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def destroy
    @category = Categorie.find(params[:id])
    @category.destroy
    flash[:success] = 'Categorie deleted'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:categorie).permit(:name, :icon)
  end
end
