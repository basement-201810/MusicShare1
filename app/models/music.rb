class Music < ApplicationRecord
	belongs_to :product

    validates :music_name, presence: true
    validates :music_disk_number, presence: true
    validates :product_id, presence: true
    validates :music_number, presence: true

end
