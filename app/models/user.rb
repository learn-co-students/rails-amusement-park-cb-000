class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password

  #validates_presence_of :name, :password, :height, :nausea, :happiness, :tickets

  def mood
    if self.happiness && self.nausea
    if self.nausea > self.happiness
      "sad"
    elsif self.happiness > self.nausea
      "happy"
    end
    end
  end
end
