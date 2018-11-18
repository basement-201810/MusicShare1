class CartsController < ApplicationController

	def show
		@cart=current_user.carts.last
		@cart_items = @cart.cart_items
	end

end
