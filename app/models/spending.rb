class Spending < ActiveRecord::Base
	belongs_to :user
	belongs_to :transaction
end