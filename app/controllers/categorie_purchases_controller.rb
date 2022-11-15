class CategoriePurchasesController < ApplicationController
  def new
    @categorie_purchase = CategoriePurchase.new
  end

  private

  def categorie_purchase_params
    params.require(:categorie_purchase).permit(:categorie_id, :purchase_id)
  end
end
