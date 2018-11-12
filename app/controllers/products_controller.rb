class ProductsController < ApplicationController
	def index
	end

	def create
	end

	def new
	end

	def edit
	end

	def update
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
  	params.require(:product).permit(:pro_title, :pro_artist, :pro_genre_id)
  end

end
