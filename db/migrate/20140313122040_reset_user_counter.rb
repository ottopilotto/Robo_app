class ResetUserCounter < ActiveRecord::Migration
  def up 
    User.all.each do |u|
      User.reset_counters(u.id, :transactions)
    end
  end

end
