class ProductsController < ApplicationController
	def index
		@products = Product.all
		@user = current_user
	end

	def new
		@product = Product.new
		@user = current_user
	end

	def create
		@product = Product.new(product_params)
		if @product.save
			redirect_to products_path
		else
			render :index
		end
	end

	def edit
		@product = Product.find(params[:id])
		@user = current_user
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
		   redirect_to pro_genre_product_path(@product.pro_genre)
		else
			render :index
		end
		   @user = current_user
	end

	def show
		@product = Product.find(params[:id])
		@user = current_user
# ----------------------cart_item#createのための変数-------------
		@cart = @user.carts.last
		@cart_item = @cart.cart_items.new
		@cart_item.product_id = @product
# -------------------------------------------------------------
	end


	def release
		product = Product.find(params[:id])
		product.release! unless product.release?
		redirect_to products_path
	end

	def nonrelease
		product = Product.find(params[:id])
		product.nonrelease! unless product.nonrelease?
		redirect_to products_path
	end

	def research
	end


	private
	def product_params
		params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id, :pro_price, :pro_date, :pro_amount, :pro_label_id, :pro_status)
	end

end
