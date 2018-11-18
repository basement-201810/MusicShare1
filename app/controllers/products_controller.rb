class ProductsController < ApplicationController
	def index
		@products = Product.all
		@user = current_user
	end

	def new
		@product = Product.new
		@product.musics.build
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
		@reviews = Review.all
		@review = Review.group(:product_id).average(:review_star)
		@count_reviews = @product.reviews.count

# ----------------------cart_item#createのための変数-------------
		@cart = Cart.find_or_create_by(user_id: @user)
		@cart_item = @cart.cart_items.new
# -------------------------------------------------------------
	end


	def release
	end

	def nonrelease
	end

	def research
		@genres = ProGenre.all
		@search = Product.ransack(params[:q])
		@products = @search.result
	end


	private
	def product_params
			params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id, :pro_price, :pro_date, :pro_amount, :pro_label_id, :pro_status, :pro_image, musics_attributes: [:music_name, :music_disk_number, :product_id, :music_number])
	end



end



