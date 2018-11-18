class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user
	enum review_status: {release: true, nonrelease: false}

	def review_star
		5 - rating.to_i
	end
end
