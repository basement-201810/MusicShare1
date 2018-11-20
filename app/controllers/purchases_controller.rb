class PurchasesController < ApplicationController
	def new
		@purchase = Purchase.new
		@cart = current_user.carts.last
		@cart_items = CartItem.where(cart_id: @cart.id)
	end

	def create
		@purchase = Purchase.new(purchase_params)
		@purchase.user_id = current_user.id
		if @purchase.save
			@cart = Cart.new
			@cart.user_id = current_user.id
			@cart.save
			@user = current_user
			@user.point += (@purchase.get_points - @purchase.pay_points )
			@user.save

			redirect_to arigatou_path
		else
			flash[:alert] = "failed to order."
			redirect_to new_purchase_path
		end
	end

	def index
		@user_all = User.all.count
		@pur_total_sum = Purchase.sum(:pur_total)
		@purchases = Purchase.order(:status)
	end
	#------     purchase_item#index から移動↓    ------------>
	def show
	  	@purchase = Purchase.find(params[:id])
#	  	@purchase_items = Purchase.find(params[:purchase_id]).purchase_items.all
	  	@purchase_items = PurchaseItem.where(purchase_id: params[:id])
	  	@cart_items = CartItem.where(cart_id: @purchase.cart_id)
	  	@review = Review.new
	  	if params[:rating]
			@review = Review.find(reivew_params)
			@review.save(:rating => params[:rating])
		end
	end
	#------------------------------------------------------------

	def update
		@purchase = Purchase.find(params[:id])
		if @purchase.update(purchase_params)
			redirect_to purchases_path
		else
			redirect_to root_path
		end
	end

	def untreat                          #----は?????????????????????????????????------
		switch = 0
		redirect_to action: 'index'
	end

	def prepare
		switch = 1
		redirect_to action: 'index'
	end

	def sent
		switch = 2
		redirect_to action: 'index'
	end

	def arigatou
	end

	private
	def purchase_params
		params.require(:purchase).permit(:user_id, :get_points, :pay_points, :cart_id, :pur_total, :pay, :status,:date, :pur_name,
			:pur_name_kana, :pur_email, :pur_address, :pur_post_code, :pur_tell,
			purchase_items_attributes: [:purchase_id, :cart_item_id, :sub_total, :amount, :title, :artist, :image_id, :product_id])
	end

end
