class PurchasesController < ApplicationController

	before_action :authenticate_user!
	# before_action :correct_user
	before_action :hoge

	def hoge
		@switch = 0
	end

	def new
		@purchase = Purchase.new
		@purchase.user_id = current_user.id
		@cart = current_user.carts.last
		@cart_items = CartItem.where(cart_id: @cart.id)
	end

	def create
		@purchase = Purchase.new(purchase_params)
		@purchase_item = @purchase.purchase_items.build
		@purchase.user_id = current_user.id
		
		@cart = current_user.carts.last
		@cart_items = @cart.cart_items
	    @cart_items.each do |cart_item|
	    	
	    	@purchase_item.product_id = cart_item.product_id
	    	@purchase_item.image_id = cart_item.product.pro_image_id
	    	@purchase_item.artist = cart_item.product.pro_artist
	    	@purchase_item.title = cart_item.product.pro_title
	    	@purchase_item.amount = cart_item.amount
	    	@purchase_item.sub_total = cart_item.sub_total
	    	@purchase_item.cart_item_id = cart_item.id
	    	@purchase_item.purchase_id = cart_item.cart.purchase_id


			if @purchase.save
				@purchase_item.save
					@review = Review.new
					@review.user_id = current_user.id
					@review.purchase_item_id = @purchase_item.id
					@review.product_id = @purchase_item.product_id
					@review.review_body = ""
					@review.review_status = true
				@review.save
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
	end

	def index
		@user_all = User.all.count
		@pur_total_sum = Purchase.sum(:pur_total)
		@purchases = Purchase.all
		# starus別表示のための変数
		@purchases_0 = Purchase.where(status: 0)
		@purchases_1 = Purchase.where(status: 1)
		@purchases_2 = Purchase.where(status: 2)
	end

	#------     purchase_item#index から移動↓    ------------>
	def show
	  	@purchase = Purchase.find(params[:id])
#	  	@purchase_items = Purchase.find(params[:purchase_id]).purchase_items.all
	  	@purchase_items = PurchaseItem.where(purchase_id: params[:id])
	  	@cart_items = CartItem.where(cart_id: @purchase.cart_id)
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
		@switch = 0
		render :index
	end

	def prepare
		@switch = 1
		render :index
	end

	def sent
		@switch = 2
		render :index
	end

	def arigatou
		@user = current_user
	end

	# def correct_user
	# 	@user = current_user
	# 	@purchase = Purchase.find(params[:id])
	# 	redirect_to root_path unless @user == current_user || @user.manager == true
 #    end

	private
	def purchase_params
		params.require(:purchase).permit(:user_id, :get_points, :pay_points, :cart_id, :pur_total, :pay, :status, :date, :pur_name,
			:pur_name_kana, :pur_email, :pur_address, :pur_post_code, :pur_tell)
	end

end
