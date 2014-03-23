class TransactionsController < ApplicationController

	before_filter :authenticate_user!

	def new
		@transaction = Transaction.new
	end

	def create
		@transaction = current_user.transactions.build(transaction_params)
		@transaction.credits = @transaction.amount
		current_user.credits += @transaction.credits
		if current_user.save
			# current_user.credits += @transaction.credits
			redirect_to root_path
		else
			flash[:notice] = "Please fill in all fields"
			render 'new'
		end
	end

	private

	def transaction_params
		params.require(:transaction).permit(:first_name, :last_name, :number, :month, :year, :verification_value, :amount)
	end
end