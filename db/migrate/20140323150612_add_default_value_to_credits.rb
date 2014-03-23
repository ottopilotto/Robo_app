class AddDefaultValueToCredits < ActiveRecord::Migration
 
def up
    change_column :users, :credits, :integer, :default => 2
end

def down
    change_column :users, :credits, :integer, :default => nil
end

end

