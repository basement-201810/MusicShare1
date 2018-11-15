class CartItemsController < ApplicationController



	# before_action :authenticater_user!
	# before_action :correct_user, only:[:create]

	# newアクション不要
	# def new
	# end

	def create
		# cart_item_new = CartItem.new(cart_item_params)
		# cart_item_new.cart_id = current_user.carts.last
		# cart_item_new.product_id = params[:product_id]
		# cart_item_new.save
		# redirect_to cart_path(current_user.carts.last)
		cart = current_user.carts.last
		cart_item = cart.cart_items.new(cart_item_params)
		cart_item.product_id = params[:product_id]
		cart_item.save
		redirect_to cart_path(cart)

	end

	# indexアクション不要
	# def index
	# end

    # editアクション不要
	# def edit
	# end

	def update
		cart_item_id = CartItem.find(params[:id])
		cart_item_id.update(cart_item_params)
		redirect_to cart_path(cart_item_id.cart)
	end

	def destroy
		cart_item_id = CartItem.find(params[:id])
		cart_item_id.destroy
		redirect_to cart_path(cart_item_id.cart)
	end

	# def correct_user
	# 	@cart = CartItem.find(params[:id]).cart_id
	# 	@user = @cart.user_id
	# 	redirect_to user_session_path unless @user == current_user
	#end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount,:cart_id,:product_id)
	end

end



# ticket = current_user.tickects.new
# ticket.event_id = params[:event_id]
# ticket.comment = params[:ticket][:comment]
# ticket.save