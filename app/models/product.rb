class Product < ApplicationRecord
	attachment :pro_image
	has_many :musics, dependent: :destroy
	accepts_nested_attributes_for :musics, allow_destroy: true
	# has_many :carts
	has_many :reviews
	belongs_to :pro_label
	belongs_to :pro_genre
	has_many :cart_items
	enum pro_status: {release: true, nonrelease: false}

	accepts_nested_attributes_for :musics

    validates :pro_artist, presence: true
    validates :pro_title, presence: true
	validates :pro_price, presence: true, numericality: true
	validates :pro_amount, presence: true, numericality: true

end

