class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.where(author_id: current_user.id)
  end

  def new
    @purchase = Purchase.new
    @categories = current_user.categories.order(:id)
  end

  def create
    @category = Category.find(params[:category_id])
    if @category.author != current_user
      flash[:alert] = 'You can only create expenses from your categories'
      redirect_to categories_path
    end
    if purchase_params[:category_ids].length == 1
      flash[:alert] = 'Must select at least one category'
      redirect_to new_category_purchase_path(@category)
    else
      @category = Category.find(params[:category_id])
      @purchase = Purchase.new(purchase_params)
      @purchase.author = current_user

      if @purchase.save
        flash[:notice] = 'Expense was created successfully'
        redirect_to category_purchases_path(@category)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def destroy
    @purchase = Purchase.find(params[:id])
    @purchase.destroy
    flash[:success] = 'Purchase deleted'
    redirect_to purchases_path
  end

  private

  def purchase_params
    params.require(:purchase).permit(:name, :amount, category_ids: [])
  end
end
