class CategoryPurchasesController < ApplicationController
  def new
    @category_purchase = CategoryPurchase.new
  end

  private

  def category_purchase_params
    params.require(:category_purchase).permit(:category_id, :purchase_id)
  end
end
