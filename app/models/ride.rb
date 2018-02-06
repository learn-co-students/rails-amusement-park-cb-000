class Ride < ActiveRecord::Base
  belongs_to :user
  belongs_to :attraction

  def take_ride
    if no_luck?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    elsif short?
      "Sorry. You are not tall enough to ride the #{attraction.name}."
    elsif out_of_tickets?
      "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    else
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.mood
      user.save
    end
  end

  def no_luck?
    short? && out_of_tickets?
  end

  def short?
    user.height < attraction.min_height
  end

  def out_of_tickets?
    user.tickets < attraction.tickets
  end
end
