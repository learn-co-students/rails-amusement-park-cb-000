class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction

  def take_ride
    messages = []
    messages << "You do not have enough tickets to ride the #{self.attraction.name}." if self.user.tickets < self.attraction.tickets
    messages << "You are not tall enough to ride the #{self.attraction.name}." if self.user.height < self.attraction.min_height
    if messages.present?
      return "Sorry. " + messages.join(" ") if messages.present?
    else
      update_stats
      return "Thanks for riding the #{self.attraction.name}!"
    end
  end

  def update_stats
    self.user.tap do |u|
      u.tickets -= self.attraction.tickets
      u.nausea += self.attraction.nausea_rating
      u.happiness += self.attraction.happiness_rating
    end.save
  end

end
