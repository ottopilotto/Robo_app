class TransactionGateway
	def self.get
		ActiveMerchant::Billing::AuthorizeNetGateway.new(:login => '7Me8y7YqMu4n', :password => '8mZkY57NG5J3q94Z')
	end
end
