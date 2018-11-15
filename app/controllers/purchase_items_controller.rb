class PurchaseItemsController < ApplicationController
  def index
  	@purchase = Purchase.find(params[:purchase_id])
  	@purchase_items = Purchase.find(params[:purchase_id]).purchase_items.all
  	@cart_items = Cart_item.find(@purchase_items.cart_item_id).all
  	@products = Product.find(@cart_item.product_id).all
  end
end
