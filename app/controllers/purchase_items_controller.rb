class PurchaseItemsController < ApplicationController
#  def new
#  	@purchase_item = PurchaseItem.new
#  end
#
#  def create
#  	@cart = current_user.cart.last
#  	@purchase_items = PurchaseItem.new(purchase_item_params)
#
#  end

  def index
  	@purchase = Purchase.find(params[:purchase_id])
#  	@purchase_items = Purchase.find(params[:purchase_id]).purchase_items.all
  	@purchase_items = PurchaseItem.where(purchase_id: params[:purchase_id])
  	@cart_items = CartItem.where(cart_id: @purchase.cart_id)

  end

  private
  def purchase_item_params
  	params.require(:purchase_item).permit(:purchase_id, :cart_item_id, :amount)
  end
end
