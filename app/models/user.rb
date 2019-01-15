class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  enum :role => [:admin, :vip, :user]

  def mood
    if self.nausea > self.happiness
      return 'sad'
    else
      return 'happy'
    end
  end
end
