class ProGenresController < ApplicationController
	before_action :average_calc

	def index
		if user_signed_in?
			@user = User.find(current_user.id)
		end
		@products = Product.where(pro_status: "release").order("average_score DESC").limit(4)
		@genres = ProGenre.all
		@genres_jpop = Product.where(pro_genre_id:1).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_kpop = Product.where(pro_genre_id:2).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_idle = Product.where(pro_genre_id:3).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_douyou = Product.where(pro_genre_id:4).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_rock = Product.where(pro_genre_id:5).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_edm = Product.where(pro_genre_id:6).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_dance = Product.where(pro_genre_id:7).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_alternative = Product.where(pro_genre_id:8).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_rap = Product.where(pro_genre_id:9).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_anime = Product.where(pro_genre_id:10).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_jazz = Product.where(pro_genre_id:11).where(pro_status: "release").order("pro_date DESC").limit(4)
		@genres_otherwise = Product.where(pro_genre_id:12).where(pro_status: "release").order("pro_date DESC").limit(4)

		@search = Product.ransack(params[:q])
	end

	def show
		@genre = ProGenre.find(params[:id])
		@genres = ProGenre.all
		@products = @genre.products.where(pro_status: "release").order("pro_date DESC")
		@user = current_user
		@search = Product.ransack(params[:q])
	end

	def result
	end

	def search
	end

	def average_calc
		@products = Product.all
		@products.each do |product|
			product.average_score = product.star_average.round(2)
			product.save
		end
	end


	def product_params
		params.require(:product).permit(:pro_image_id, :pro_price, :pro_genre_id, :pro_date, :pro_amount, :pro_title, :pro_label_id, :pro_artist, :pro_status, :created_at, :updated_at)
	end
end

