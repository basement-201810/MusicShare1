class CartsController < ApplicationController

	def show
		@cart = Cart.find(params[:id])
		@cart_items = @cart.cart_items.all
	end

	def new
	end

	def create
	end

	def edit
	end

	def update
	end

end
