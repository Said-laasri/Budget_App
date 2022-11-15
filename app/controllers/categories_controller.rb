class CategoriesController < ApplicationController
  def index
    @categories = Categorie.all
  end

  def new
    @categories = Categorie.new
  end

  def show
    @categorie = Categorie.find(params[:id])
  end

  def create
    new_categorie = current_user.categories.new(categorie_params)
    respond_to do |format|
      format.html do
        if new_categorie.save
          redirect_to new_categories_path, notice: 'Categorie was successfully Saved'
        else
          render :new, status: 'Error occured will saving Categorie'
        end
      end
    end
  end

  def destroy
    @category = Categorie.find(params[:id])
    @category.destroy
    flash[:success] = 'Categorie deleted'
    redirect_to categories_path
  end

  private

  def categorie_params
    params.require(:categorie).permit(:name, :icon)
  end
end
