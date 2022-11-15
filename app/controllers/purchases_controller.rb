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
    @purchase = Purchase.new(purchase_params)
    if @purchase.save
      flash[:success] = 'Purchase created'
      redirect_to purchases_path
    else
      render 'new'
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
    params.require(:purchase).permit(:name, :icon)
  end
end
