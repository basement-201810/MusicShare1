class ProductsController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, except: [:show]

	# before_action :sum_amount
	# def sum_amount
	# 	cart_items = CartItem.where(product_id: product_id).select(:amount)
	# 	product.pro_amount -= cart_items.sum {|cart_item| cart_item.amount}
	# 	product.save
	# end


	def index
		@products = Product.order('pro_amount')
		@user = current_user
		@genres = ProGenre.all
		@search = Product.ransack(params[:q])
		@result = @search.result.order('pro_amount')
		@product_cnt = Product.all.count
		@result_cnt = @result.count
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
			render :new
		end
	end

	def edit
		@product = Product.find(params[:id])
		@user = current_user
	end

	def update
		@product = Product.find(params[:id])
		if @product.update(product_params)
		   redirect_to products_path
		else
			render :edit
		end
		   @user = current_user
	end

	def destroy
		music = Music.find(params[:id])
		music.destroy
	end

	def show
		@product = Product.find(params[:id])
		@user = current_user
		@reviews = Review.all
		@review = Review.group(:product_id).average(:review_star)
		@count_reviews = @product.reviews.count
		@music = Music.where(product_id:@product.id)

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
		@products = @search.result.order("pro_date DESC")
	end

	def correct_user
        @user = current_user
        redirect_to root_path unless @user.manager == true
    end



	private
	def product_params
		params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id, :pro_price, :pro_date, :pro_amount, :pro_label_id, :pro_status, :pro_image, musics_attributes: [:id, :music_name, :music_disk_number, :product_id, :music_number, :_destroy])
	end

	def review_params
		params.require(:review).permit(:review_body, :review_star, :review_status)
	end



end



