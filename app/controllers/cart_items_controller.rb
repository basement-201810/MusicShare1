class CartItemsController < ApplicationController
	before_action :authenticate_user!
	# before_action :hoge

	def create
		product = Product.find(params[:product_id])
		product.pro_amount -= params[:cart_item][:amount].to_i
		cart = current_user.carts.last
	    # --------------product/showへのリダイレクト用の変数-------------
		@product = Product.find(params[:product_id])
		@user = current_user
		@review = Review.all

		@cart = Cart.find_or_create_by(user_id: @user)
		@cart_item = @cart.cart_items.new
	    # -------------------------------------------------------------
	    if product.pro_amount >= 0
			product.save

			# カート内にすでに含まれている商品か確かめる
			id = 0
			cart.cart_items.each do |cart_item|
				if cart_item.product_id == params[:product_id].to_i
					id = cart_item.id
				end
			end

			# カート内にまだ含まれていない商品(id == 0)の場合
			if id == 0
				cart_item = cart.cart_items.new(cart_item_params)
				cart_item.product_id = params[:product_id]
				if cart_item.save
				    redirect_to cart_path(cart),notice: "※ カートに商品が追加されました ※"
				else
				 	redirect_to product_path(params[:product_id])
				end

			# カート内にすでに含まれている商品(id ！= 0)の場合
			else
				cart_item = CartItem.find(id)
				cart_item.amount += params[:cart_item][:amount].to_i
				if cart_item.save
					redirect_to cart_path(cart),notice: "※ 注文内容が変更されました ※"
				else
				 	redirect_to product_path(params[:product_id])
				end
			end
		else
			redirect_to product_path(params[:product_id])
		end
	end


	def update
		cart_item = CartItem.find(params[:id])
		product = cart_item.product
		product.pro_amount += cart_item.amount - params[:cart_item][:amount].to_i
		if product.pro_amount >= 0
			product.save
		    if cart_item.update(cart_item_params)
		    	redirect_to cart_path(cart_item.cart),notice: "※ 注文内容が変更されました ※"
		    else
		    	redirect_to cart_path(cart_item.cart)
		    end
		else
			redirect_to cart_path(cart_item.cart)
		end
	end

	def destroy
		cart_item = CartItem.find(params[:id])
		product = cart_item.product
		product.pro_amount += cart_item.amount.to_i
		product.save
		if cart_item.destroy
			redirect_to cart_path(cart_item.cart),notice: "※ 注文内容が変更されました ※"
		end
	end

	# def hoge
	# 	cart_items = CartItem.where("created_at<?",Time.now-(12.hours))
	# 	cart_items.each do |cart_item|
	# 		cart_item.product.pro_amount += cart_item.amount.to_i
	# 		cart_item.product.save
	# 		cart_item.destroy
	# 	end
	# 	# CartItem.where("created_at<?",Time.now-(12.hours)).delete_all
	# end

	private
	def cart_item_params
		params.require(:cart_item).permit(:amount,:cart_id,:product_id)
	end

end
