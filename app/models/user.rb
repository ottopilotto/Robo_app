class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :transactions
  has_many :spendings


  def payment
    self.credits -= 1 
    save
  end

  def has_credits?
    self.credits > 0
  end
end






