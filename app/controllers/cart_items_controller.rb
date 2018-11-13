class CartItemsController < ApplicationController

	# before_action :authenticater_user!
	# before_action :correct_user, only:[:create]


	# newアクションは不要説あり
	def new
	end


	# 商品詳細ページで"カートへ入れる"ボタンを押した時のアクション
	# カート内一覧ページへリダイレクトさせる　pathの()内要確認
	def create
		cart = Cart.find(params[:cart_id])
		cart_item = current_cart.cart_items.new(cart_item_params)
		cart_item.product_id  = current_product
		cart_item.save
		redirect_to cart_path(current_cart)
	end

	 # indexアクションは不要説あり
	def index
	end

	# editアクションは不要説あり
	def edit
	end

	def update
		@cart_item_id = CartItem.find(params[:id])
		@cart_item_id.update(cart_item_params)
		redirect_to cart_path(@cart_item_id.cart)
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
 #    end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount,:cart_id,:product_id)
	end

end

