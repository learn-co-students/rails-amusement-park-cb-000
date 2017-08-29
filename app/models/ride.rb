class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    message = "Sorry."
    if user.tickets < attraction.tickets
      message = "#{message} You do not have enough tickets to ride the #{attraction.name}."
    end

    if user.height < attraction.min_height
      message = "#{message} You are not tall enough to ride the #{attraction.name}."
    end

    if message.length > 7
      message
    else
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      message = "Thanks for riding the #{attraction.name}!"
    end
  end
end
