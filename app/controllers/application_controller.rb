class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	before_action :average_calc


	# Cartのuser_idが、ログインしたuserのidかを検索。
	# ヒットすれば初めの一件を取得、1件もなければ新しくCartのレコードを作成
	def after_sign_in_path_for(resource)
		# if (current_user.manager == true)
		# 	products_path
		# else
			Cart.find_or_create_by(user_id: current_user.id)
			root_path
		# end
	end

	#商品のレビュー平均をaverage_scoreカラムに入れる
	def average_calc
		@products = Product.all
		@products.each do |product|
			product.average_score = product.star_average.round(2)
			product.save
		end
	end

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :name_kana, :address, :post_code, :tell, :user_status, :manager])
	end


end





