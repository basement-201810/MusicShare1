class CartsController < ApplicationController


	# before_action :authenticater_user!
	# before_action :correct_user


	def show
		@cart=current_user.carts.last
		@cart_items = @cart.cart_items

	end

	# def new
	# end

	# def create
	# 	cart = Cart.new(user)
	# 	cart.user_id = current_user
	# 	cart.save
	# 	redirect_to root_path
	# end

	def edit
	end

	def update
	end

	# def correct_user
	# 	@cart_id = Cart.find(params[:id]).user_id
	# 	@user = @cart_id.user_id
	# 	redirect_to user_session_path unless @user == current_user
    #    end


	# private
	# def cart_params
	# 	params.require(:cart).permit(:user_id)
	# end
end


