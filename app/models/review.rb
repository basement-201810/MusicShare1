class Review < ApplicationRecord
	belongs_to :product
	belongs_to :user
	enum review_status: {release: true, nonrelease: false}
	belongs_to :purchase_item

end
