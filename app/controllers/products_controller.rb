class ProductsController < ApplicationController

	before_action :authenticate_user!,except: [:show,:research]
	before_action :correct_user, except: [:show,:research]


	def index
		@products = Product.where(pro_status:"release").page(params[:page]).per(10).order('pro_amount')
		@products_non = Product.where(pro_status:"nonrelease").page(params[:page]).per(10).order('pro_amount')
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
		@reviews = Review.where(product_id: params[:id]).where.not(review_body: "")
	#	@review = @product.reviews.average(:review_star).round(2)    ←徳本変更　@review = Review.group(:product_id).average(:review_star)
		@count_reviews = @product.reviews.where.not(review_star: 0, review_status: false).count
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



end



