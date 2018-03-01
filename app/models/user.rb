class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides
  has_secure_password
#  it "is valid with a name, password, happiness, nausea, height, and tickets" do

  def mood
    self.happiness > self.nausea ? "happy":"sad"
  end

end
