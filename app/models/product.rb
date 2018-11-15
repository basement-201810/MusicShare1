class Product < ApplicationRecord
	attachment :image
	has_many :musics
	# has_many :carts
	has_many :reviews
	belongs_to :pro_label
	belongs_to :pro_genre
	has_many :cart_items
	enum pro_status: {release: true, nonrelease: false}

end

