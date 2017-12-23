class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user
  
  def take_ride
    if attraction.tickets <= user.tickets && attraction.min_height <= user.height
      user.tickets -= attraction.tickets
      user.nausea += attraction.nausea_rating
      user.happiness += attraction.happiness_rating
      user.save
    elsif attraction.tickets > user.tickets && attraction.min_height <= user.height
      alert = "Sorry. You do not have enough tickets to ride the #{attraction.name}."
    elsif attraction.min_height > user.height && attraction.tickets <= user.tickets
      alert = "Sorry. You are not tall enough to ride the #{attraction.name}."
    else
      alert = "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
    end
  end
end