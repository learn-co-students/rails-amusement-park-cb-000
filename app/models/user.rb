class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  #method to find whether the user is an admin or not.
  def admin?
    self.admin
  end

  #method to return the proper mood depending on whether the user has a higher nausea than happiness rating.
  def mood
    if self.nausea > self.happiness
      return 'sad'
    else
      return 'happy'
    end
  end
end
