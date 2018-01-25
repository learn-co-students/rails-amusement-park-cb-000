class User < ActiveRecord::Base

  #associations
  has_many :rides
  has_many :attractions, :through => :rides

  #validations
  #validates :email, :format => {:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }
  #validates :nausea , :length => {:minimum => 1, :maximum => 5}
  #validates :happiness, :length => {:minimum => 1, :maximum => 5}

  has_secure_password

  def mood
    self.nausea > self.happiness ?  'sad' : 'happy'
  end

  def admin?
    return self.admin
  end

  def admin!
    self.update_attribute(:admin, true)
  end

  def update_user_rates_and_tickets(attraction)
    self.update_attribute(:tickets, self.tickets - attraction.tickets)
    self.update_attribute(:happiness, self.happiness + attraction.happiness_rating)
    self.update_attribute(:nausea, self.nausea + attraction.nausea_rating)
  end


end
