class Product < ApplicationRecord
	attachment :pro_image
	has_many :musics,inverse_of: :product
	accepts_nested_attributes_for :musics, allow_destroy: true
	# has_many :carts
	has_many :reviews
	belongs_to :pro_label
	belongs_to :pro_genre
	has_many :cart_items
	enum pro_status: {release: true, nonrelease: false}



    validates :pro_artist, presence: true
    validates :pro_title, presence: true
	validates :pro_price, presence: true, numericality: true
	validates :pro_amount, presence: true, numericality: true

	def star_average
		if reviews.where.not(review_star: 0, review_status: false).count == 0
			return 0
		else
			(reviews.where.not(review_star: 0, review_status: false).to_a.sum { |review| review.review_star }  / reviews.where.not(review_star: 0, review_status: false).all.count.to_f ).round(2)
		end
	end

end

