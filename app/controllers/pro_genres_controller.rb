class ProGenresController < ApplicationController

	def index
		@products = Product.all
		@genres = ProGenre.all
		@genres_jpop = Product.where(pro_genre_id:1)
		@genres_kpop = Product.where(pro_genre_id:2)
		@genres_douyou = Product.where(pro_genre_id:3)
		@genres_rock = Product.where(pro_genre_id:4)
		@genres_edm = Product.where(pro_genre_id:5)
		@genres_dance = Product.where(pro_genre_id:6)
		@genres_alternative = Product.where(pro_genre_id:7)
		@genres_rap = Product.where(pro_genre_id:8)
		@genres_anime = Product.where(pro_genre_id:9)
		@genres_jazz = Product.where(pro_genre_id:10)
		@genres_otherwise = Product.where(pro_genre_id:11)
	end

	def show
	end

	def research
	end
end
