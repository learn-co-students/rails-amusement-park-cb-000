class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  validates :user_id, :attraction_id, presence: true

  def take_ride
    attraction = Attraction.find(attraction_id)
    user = User.find(user_id)
    @no_rides_for_you = String.new

    if attraction.tickets > user.tickets && attraction.min_height > user.height
      @no_rides_for_you = "Sorry. You do not have enough tickets to ride the #{attraction.name}. " +
      "You are not tall enough to ride the #{attraction.name}."
    elsif attraction.tickets > user.tickets
      @no_rides_for_you = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height
      @no_rides_for_you = "Sorry. You are not tall enough to ride the #{attraction.name}."
    end
    if @no_rides_for_you.empty?
      user.update(:tickets => user.tickets - attraction.tickets,
                                           :happiness => user.happiness + attraction.happiness_rating,
                                           :nausea => user.nausea + attraction.nausea_rating)
    end
    return @no_rides_for_you
  end
end
