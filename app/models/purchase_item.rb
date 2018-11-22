class PurchaseItem < ApplicationRecord
	belongs_to :purchase
	attachment :image
	has_one :review
end
