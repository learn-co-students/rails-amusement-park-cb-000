class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
  if !enough_tickets? && !tall_enough?
    "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
    elsif !enough_tickets?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
    elsif !tall_enough?
      "Sorry. You are not tall enough to ride the #{self.attraction.name}."
    else
      #binding.pry
      user.tickets = user.tickets - attraction.tickets
      user.nausea = user.nausea + attraction.nausea_rating
      user.happiness = user.happiness + attraction.happiness_rating
      user.save
      "Thanks for riding the #{self.attraction.name}!"
    end
  end


  def tall_enough?
    user.height >= attraction.min_height
  end

  def enough_tickets?
    user.tickets >= attraction.tickets
  end

end
