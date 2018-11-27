class CartsController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user

	def show
		@cart = current_user.carts.last
		@cart_items = @cart.cart_items
	end

	def correct_user
		@cart = Cart.find(params[:id])
        @user = @cart.user
        redirect_to root_path unless @user == current_user
    end

end
