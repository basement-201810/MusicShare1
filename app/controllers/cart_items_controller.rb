class CartItemsController < ApplicationController


	def create
		cart = current_user.carts.last
		cart_item = cart.cart_items.new(cart_item_params)
		cart_item.product_id = params[:product_id]
		if cart_item.save
			redirect_to cart_path(cart),notice: "※ カートに商品が追加されました ※"
		end

	end

	def update
		cart_item_id = CartItem.find(params[:id])
		if cart_item_id.update(cart_item_params)
			redirect_to cart_path(cart_item_id.cart),notice: "※ 注文内容が変更されました ※"
		end
	end

	def destroy
		cart_item_id = CartItem.find(params[:id])
		if cart_item_id.destroy
			redirect_to cart_path(cart_item_id.cart),notice: "※ 注文内容が変更されました ※"
		end
	end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount,:cart_id,:product_id)
	end

end
