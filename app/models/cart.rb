class Cart < ApplicationRecord

	# belongs_to :product
	has_many :cart_items
	belongs_to :user

	def total
		cart_items.to_a.sum { |cart_item| cart_item.sub_total }
	end
end
