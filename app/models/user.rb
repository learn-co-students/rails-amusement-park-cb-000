class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  # write associations here
  has_secure_password

  #validations
  #validates :name, :password, :happiness, :nausea, :height, :tickets, presence: true

  def mood
    nausea >= happiness ? "sad" : "happy"
  end
end
