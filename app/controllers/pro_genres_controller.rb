class ProGenresController < ApplicationController

	def index
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
	end

	def show
		@genre = ProGenre.find(params[:id])
		@genres = ProGenre.all
		@products = @genre.products.page(params[:page])
	end

	def research
		@genre = ProGenre.all
	end

	def product_params
		params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id, :pro_price, :pro_date, :pro_amount, :pro_label_id, :pro_status)
	end
end
