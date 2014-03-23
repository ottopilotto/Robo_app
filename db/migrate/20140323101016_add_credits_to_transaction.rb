class AddCreditsToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :credits, :integer
  end
end
