class Purchase < ApplicationRecord
	belongs_to :user
	has_many :purchase_items

	accepts_nested_attributes_for :purchase_items

	enum status: {untreated: 0, prepare: 1, sent: 2}

	validates :pur_name, presence: true
	validates :pur_address, presence: true
	validates :pur_post_code, presence: true
	validates :pur_tell, presence: true


#	default_scope -> {order (status: :desc)}
#    < ApplicationRecord

#	private
#
#	  ransacker :status, formatter: proc { |value|
#	    sym = Purchase.statuses_i18n.invert[value]
#	    if sym.blank?
#	      raise "unexpected status accessed: #{value}"
#	    else
#	      sym
#	    end
#	  } do |parent|
#	    parent.table[:status]
#	end
end
