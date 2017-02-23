class User < ActiveRecord::Base
  # write associations here
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides

  # validates :name,
  #           :password,
  #           :presence => true


  def mood
    if self.happiness && self.nausea
      self.happiness > self.nausea ? "happy" : "sad"
    end
  end

  def num_of_rides
    attractions.count
  end
end
