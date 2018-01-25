class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    messages = []
    if user.tickets < attraction.tickets
      messages << "You do not have enough tickets to ride the #{attraction.name}."
    end
    if user.height < self.attraction.min_height
      messages << "You are not tall enough to ride the #{attraction.name}."
    end
      user.update_user_rates_and_tickets(attraction)
      return messages.unshift("Sorry.").join(" ")
  end

end
