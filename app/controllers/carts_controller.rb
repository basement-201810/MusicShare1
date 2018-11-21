class CartsController < ApplicationController

	def show
		# @cart = Cart.find(params[:id])
		@cart=current_user.carts.last
		@cart_items = @cart.cart_items
	end

end
