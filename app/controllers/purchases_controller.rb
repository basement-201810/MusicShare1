class PurchasesController < ApplicationController
	def new
		@cart = current_user.carts.last
		@purchase = Purchase.new
		@cart = current_user.carts.last
		@cart_items = CartItem.where(cart_id: @cart.id)
	end

	def create
		@purchase = Purchase.new(purchase_params)
		@cart = current_user.carts.last
		@cart_items = CartItem.where(cart_id: @cart.id)

		@purchase.user_id = current_user.id
		if @purchase.save
			redirect_to arigatou_path
		else
			redirect_to root_path
		end
	end

	def index
		@user_all = User.all.count
		@pur_total_sum = Purchase.sum(:pur_total)
		@purchases = Purchase.all
	end

	def show
	end

	def untreat
	end

	def prepare
	end

	def sent
	end

	def arigatou
	end

	private
	def purchase_params
		params.require(:purchase).permit(:user_id, :get_points, :pay_points, :cart_id, :pur_total, :pay, :status,:date, :pur_name, 
			:pur_name_kana, :pur_email, :pur_address, :pur_post_code, :pur_tell,
			purchase_items_attributes: [:purchase_id, :cart_item_id, :sub_total, :amount])
	end

	def purchase_item_params
		params.require(:purchase_item).permit(:purchase_id, :cart_item_id, :sub_total, :amount)
	end

end
