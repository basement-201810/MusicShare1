class Cart < ApplicationRecord
	belongs_to :product
	has_many :cart_items
	belongs_to :user
end
