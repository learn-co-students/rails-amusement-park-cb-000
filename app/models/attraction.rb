class Attraction < ActiveRecord::Base
  # associations
  has_many :rides
  has_many :users ,:through => :rides

  def ride_title(user)
    Ride.where(:user_id => user, :attraction_id => self.id).first.title
  end

end
