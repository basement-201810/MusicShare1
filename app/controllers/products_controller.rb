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
		@product = Product.find(parmas[:id])
		if @product.update(product_params)
		   redirect_to pro_genre_product_path(@product.pro_genre)
		else
			render :index
		end
		   @user = current_user
	end

	def show
		@product = Product.find(params[:id])
		@cart = Cart.all
		@user = current_user
	end

	def release
	end

	def nonrelease
	end


	private
	def product_params
		params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id, :pro_price, :pro_date, :pro_amount, :pro_label_id, :pro_status)
	end

end
