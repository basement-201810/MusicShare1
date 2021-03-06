class ReviewsController < ApplicationController
	# def new
	# 	@review = Review.new
	# end

	# def create
	# 	@reviews = current_user.reviews
	# 	@review = Review.new(review_params)
	# 	@review.product_id = params[:id].purchase_items.product_id
	# 	@review.user_id = current_user.id

	# 	x = 0
	# 	@reviews.each do |review|
	# 		if review.product_id == @review.product_id
	# 			x = review.id
	# 		end
	# 	end

	# 	if x = 0
	# 		if @review.save!
	# 			redirect_to user_path(current_user), notice: 'Review was successfully created!'
	# 		else
	# 			redirect_to request.referrer
	# 		end
	# 	else
	# 		@review = Review.find(x)
	# 		@review.review_body = params[:@review][:review_body]
	# 		@review.review_star = parmas[:@review][:review_star]
	# 		if @review.save
	# 			redirect_to user_path(current_user), notice: 'Review was successfully updated.'
	# 		else
	# 			redirect_to request.referrer
	# 		end
	# 	end
	# end

	def edit
		@review = Review.find(params[:id])
	end

	def update
		@review = Review.find(params[:id])
		if @review.update!(review_params)
			if current_user.manager

				redirect_to request.referrer, notice: 'レビューの強制編集しました'  #一応管理者は編集したらそのページにとどまる形になってます

			else
				if  @review.first_review
					@review.user.point += 10
					@review.user.save
					@review.first_review = false
					@review.save
					redirect_to request.referrer, notice: 'レビュー投稿完了！　10 ポイントゲット!!'
				else
					redirect_to request.referrer, notice: 'レビュー編集しました！'
				end
			end
		else
			render request.referrer, notice: 'レビュー投稿に失敗しました'
		end
	end

	def release
		@review = Review.find(params[:id])
		@review.release! unless review.release?
		redirct_to product_path(@product.id)
	end

	def nonrelease
		@review = Review.find(parmas[:id])
		@review.nonrelease! unless review.nonrelease?
		redirect_to product_path(@product.id)
	end
end

private
def review_params
	params.require(:review).permit(:review_body, :review_star, :review_status, :review_points)
end
