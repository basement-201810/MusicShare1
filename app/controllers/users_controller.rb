class UsersController < ApplicationController
	before_action :authenticate_user!

	def index
		@users = User.all
		@user = User.find(current_user.id)
	end

	def show
		@user = User.find(params[:id])
		@purchases = User.find(params[:id]).purchases.all
	end

	def update
		@user = User.find(params[:id])
		if @user.update!(user_params)
			redirect_to user_path(@user.id), notice: 'Profile was successfully updated!!'
		else
			render :edit
		end
	end

	def edit
		@user = User.find(params[:id])
	end

	def release
		user = User.find(params[:id])
		user.release! unless user.release? # => releaseがfalse
		redirect_to users_path
	end

	def nonrelease
		user = User.find(params[:id])
		user.nonrelease! unless user.release? # => nonreleaseがfalse
		redirect_to users_path
	end

	def passchange
		@user = User.find(params[:id])
	end
end

private
def user_params
	params.require(:user).permit(:name, :name_kana, :email, :tell, :post_code, :address, :point, :user_status, :manager, :memo)
end