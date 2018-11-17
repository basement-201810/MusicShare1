class Purchase < ApplicationRecord
	belongs_to :user
	has_many :purchase_items
	enum status:{未処理: 0, 準備中: 1, 発送済み: 2}
end
