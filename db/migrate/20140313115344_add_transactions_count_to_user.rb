class AddTransactionsCountToUser < ActiveRecord::Migration
  def change
    add_column :users, :transactions_count, :integer, default: 0
  end
end
