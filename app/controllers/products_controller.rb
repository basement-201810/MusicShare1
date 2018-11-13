class ProductsController < ApplicationController
	def index
		@products = Product.all
		@pro_genre = ProGenre.all
	end

	def new
		@product = Product.new
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
		@genre = ProGenre.find(params[:id])
		@genres = ProGenre.all
	end

	def update
		@product = Product.find(parmas[:id])
		@product.update(product_params)
		redirect_to products_path
	end

	def show
		@product = Product.find(params[:id])
		@cart = Cart.all
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
