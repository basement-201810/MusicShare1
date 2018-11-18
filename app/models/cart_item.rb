class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	validates :amount, presence: true

	def sub_total
		product.pro_price * amount
	end
end

