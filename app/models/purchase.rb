class Purchase < ApplicationRecord
	belongs_to :user
	has_many :purchase_items
	enum status:{untreated: 0, prepared: 1, sent: 2}
end
