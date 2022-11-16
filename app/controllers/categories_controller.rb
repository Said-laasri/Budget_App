class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def show
    @categories = Category.find(params[:id])
  end

  

  def create
    new_category = current_user.categories.new(category_params)
    respond_to do |format|
      format.html do
        if new_category.save
          redirect_to categories_path, notice: 'Categorie was successfully Saved'
        else
          render :new, status: 'Error occured will saving Categorie'
        end
      end
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    flash[:success] = 'Categorie deleted'
    redirect_to categories_path
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
