class Product < ApplicationRecord
	attachment :pro_image
	has_many :musics
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
		if reviews.empty?
			return 0
		else
			# (reviews.to_a.sum { |review| review.review_star }  / reviews.all.count.to_f ).round(2)
		end
	end

end

