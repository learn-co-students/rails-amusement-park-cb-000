class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    if not_enough_tickets? && not_enough_height?
      'Sorry. ' + tickets_issue + ' ' + height_issue
    elsif not_enough_tickets?
      'Sorry. ' + tickets_issue
    elsif not_enough_height?
      'Sorry. ' + height_issue
    else
      complete_ride
    end
  end

  private
  def tickets_issue
    "You do not have enough tickets to ride the #{attraction.name}."
  end

  def height_issue
    "You are not tall enough to ride the #{attraction.name}."
  end

  def not_enough_tickets?
    user.tickets < attraction.tickets
  end

  def not_enough_height?
    user.height < attraction.min_height
  end

  def complete_ride
    user.tickets -= attraction.tickets
    user.nausea += attraction.nausea_rating
    user.happiness += attraction.happiness_rating
    user.save
  end
end
