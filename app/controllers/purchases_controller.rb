class PurchasesController < ApplicationController
	def create
	end

	def index
		@purchase = User.find(params[:id]).purchases.all
	end

	def show
	end

	def untreat
	end

	def prepare
	end

	def sent
	end

end
