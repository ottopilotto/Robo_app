class CreateSpendings < ActiveRecord::Migration
  def change
    create_table :spendings do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.decimal :amount
    end
  end
end
