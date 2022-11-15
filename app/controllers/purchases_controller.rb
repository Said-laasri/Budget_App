class PurchasesController < ApplicationController
  def index
    @purchases = Purchase.all
  end

  def new
    @purchase = Purchase.new
  end

  def show
    @purchase = Purchase.find(params[:id])
  end

  def create
    new_purchase = current_user.purchases.new(purchase_params)
    respond_to do |format|
      format.html do
        if new_purchase.save
          redirect_to purchases_path, notice: 'Purchase successfully Saved'
        else
          render :new, status: 'Error occured will Saving Purchase'
        end
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
    params.require(:purchase).permit(:name, :amount)
  end
end
