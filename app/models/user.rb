class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
  validates :password_digest, presence: true

  def mood
    if happiness > nausea
      "happy"
    else
      "sad"
    end
  end

  def num_of_rides
    attractions.count
  end

end
