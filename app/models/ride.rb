class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    messages = [
      self.user.not_enough_tickets_to_ride?(self.attraction),
      self.user.too_short_to_ride?(self.attraction)
    ].compact

    if messages.size > 0
      return "Sorry. #{messages.join(" ")}"
    else
      self.user.tickets -= self.attraction.tickets
      self.user.nausea += self.attraction.nausea_rating
      self.user.happiness += self.attraction.happiness_rating
      self.user.save
      return ''
    end
  end
end
