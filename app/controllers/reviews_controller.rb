class ReviewsController < ApplicationController
	def new
		@review = Review.new
	end

	def create
		@review = Review.find(params[:id])
		if @review.new(review_params)
			redirect_to purchase_path(@purchase.id), notice: 'Review was successfully created!'
		else
			render :show
		end
	end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update(review_params)
			redirect_to purchase_path(@purchase.id), notice: 'Review was successfully updated.'
		else
			render :show
		end
	end

	def release
		review = Review.find(params[:id])
		review.release! unless review.release?
		redirct_to product_path(@product.id)
	end

	def nonrelease
		review = Review.find(parmas[:id])
		review.nonrelease! unless review.nonrelease?
		redirect_to product_path(@product.id)
	end
end

private
def review_params
	params.require(:review).permit(:review_body, :review_star, :review_status, :review_points)
end
