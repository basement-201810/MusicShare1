class PurchaseItem < ApplicationRecord
	belongs_to :purchase
	attachment :image
end
