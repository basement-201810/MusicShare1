class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user
	enum review_status: {release: true, nonrelease: false}
	validates :review_body, presence: true

end
