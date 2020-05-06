class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets? && not_enough_height?
      'Sorry. ' + tickets_message + ' ' + height_message
    elsif not_enough_tickets?
      'Sorry. ' + tickets_message
    elsif not_enough_height?
      'Sorry. ' + height_message
    else
      successful_ride
    end
  end

  private
  def tickets_message
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_message
    "You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets?
    user.tickets < attraction.tickets
  end

  def not_enough_height?
    user.height < attraction.min_height
  end

  def successful_ride
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
