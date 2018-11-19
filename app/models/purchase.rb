class Purchase < ApplicationRecord
	belongs_to :user
	has_many :purchase_items
	accepts_nested_attributes_for :purchase_items
	enum status:{untreated: 0, prepare: 1, sent: 2}
#	default_scope -> {order (status: :desc)}
end
