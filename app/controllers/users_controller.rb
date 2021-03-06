class UsersController < ApplicationController

	before_action :authenticate_user!
	before_action :correct_user, only:[:show,:edit]

	def index
		@users = User.with_deleted.page(params[:page]).per(3)
		@user = User.find(current_user.id)
		if @user.manager != true
			redirect_to root_path
		end
	end

	def show
		@user = User.with_deleted.find(params[:id])
		@purchases = User.with_deleted.find(params[:id]).purchases.all.order('created_at DESC')
	end

	def edit
		@user = User.with_deleted.find(params[:id])
	end

	def update
		@user = User.with_deleted.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path, notice: 'ユーザー情報を編集しました！'

		else
			render :edit
		end

	end

	def destroy
		user = User.find(params[:id])
		user.destroy
		redirect_to users_path
	end

	# def release
	# 	user = User.find(params[:id])
	# 	user.release! unless user.release? # => releaseがfalse
	# 	redirect_to users_path
	# end

	# def nonrelease
	# 	user = User.find(params[:id])
	# 	user.nonrelease! unless user.release? # => nonreleaseがfalse
	# 	redirect_to users_path
	# end

	def correct_user
		@user = User.with_deleted.find(params[:id])
		@admin = User.find(1)
		redirect_to root_path unless @user == current_user || @admin == current_user
	end



	def passchange
		@user = User.find(params[:id])
	end


end

private
def user_params
	params.require(:user).permit(:name, :name_kana, :email, :tell, :post_code, :address, :point, :user_status, :manager, :memo, :password, :encrypted_password)
end