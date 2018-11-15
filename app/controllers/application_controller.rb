class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?
	# before_action :correct_user


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

	# #管理者がログインした時のPAthを指定
	# def correct_user
	# 	if (current_user.manager == true)
	# 		products_path
	# 	end
	# end


	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:name, :name_kana, :address, :post_code, :tell, :user_status, :manager])
	end


end





