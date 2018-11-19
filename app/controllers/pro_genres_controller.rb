class ProGenresController < ApplicationController

	def index
		if user_signed_in?
			@user = User.find(current_user.id)
		end
		@products = Product.all
		@genres = ProGenre.all
		@genres_jpop = Product.where(pro_genre_id:1)
		@genres_kpop = Product.where(pro_genre_id:2)
		@genres_idle = Product.where(pro_genre_id:3)
		@genres_douyou = Product.where(pro_genre_id:4)
		@genres_rock = Product.where(pro_genre_id:5)
		@genres_edm = Product.where(pro_genre_id:6)
		@genres_dance = Product.where(pro_genre_id:7)
		@genres_alternative = Product.where(pro_genre_id:8)
		@genres_rap = Product.where(pro_genre_id:9)
		@genres_anime = Product.where(pro_genre_id:10)
		@genres_jazz = Product.where(pro_genre_id:11)
		@genres_otherwise = Product.where(pro_genre_id:12)

		@search = Product.ransack(params[:q])
	end

	def show
		@genre = ProGenre.find(params[:id])
		@genres = ProGenre.all
		@products = @genre.products.page(params[:page]).order(:pro_date).reverse_order
		@user = current_user
		@search = Product.ransack(params[:q])
	end

	def result
	end

	def search
	end


	def product_params
		params.require(:product).permit(:pro_image_id, :pro_price, :pro_genre_id, :pro_date, :pro_amount, :pro_title, :pro_label_id, :pro_artist, :pro_status, :created_at, :updated_at)
	end
end

