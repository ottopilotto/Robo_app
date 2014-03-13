class Transaction < ActiveRecord::Base
	attr_accessor :first_name, :last_name, :number, :month, :year, :verification_value
	validates :amount, presence: true, numericality: true
	validates :first_name, :last_name, :number, :month, :year, :verification_value, presence: true
	validate :credit_card_valid
	belongs_to :user, counter_cache: true
	has_many :spendings

	before_create :purchase

	def credit_card_valid
		errors.add(:base, "Credit card is invalid") unless credit_card.valid?	
	end

	def credit_card
			ActiveMerchant::Billing::CreditCard.new(
						:first_name         => first_name,
		                :last_name          => last_name,
		                :number             => number,
		                :month              => month,
		                :year               => year,
		                :verification_value => verification_value)	
	end

	def purchase
		@price = amount*100
		response = TransactionGateway.get.purchase(@price, credit_card)
		if response.success?
		UserMailer.transaction_mail(self.user.email).deliver
		return true
		else
			errors.add(:base, "Transaction rejected : #{response.message}")
			return false
		end
	end
end