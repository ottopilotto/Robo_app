class Transaction < ActiveRecord::Migration
  def change
  	create_table :transactions do |t|
  		t.integer :user_id
  		t.decimal :amount
  	end
  end
end
