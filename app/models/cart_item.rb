class CartItem < ApplicationRecord
	belongs_to :cart
	belongs_to :product

	def sub_total
		product.pro_price * amount
	end
end

