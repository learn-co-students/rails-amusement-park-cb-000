class Ride < ActiveRecord::Base
  # write associations here
  belongs_to :user
  belongs_to :attraction


  def take_ride
    messages = []
    messages << check_tickets
    messages << check_height

    if messages.compact.empty?
      update_user
    else
      messages.unshift("Sorry.")
      messages.compact.join(' ')
    end
  end

  private

  def check_tickets
    if self.user.tickets < self.attraction.tickets
      "You do not have enough tickets the #{attraction.name}."
    end
  end

  def check_height
    self.user.height >= self.attraction.min_height ? nil : "You are not tall enough to ride the #{attraction.name}."
  end

  def update_user
    new_happiness = self.user.happiness + self.attraction.happiness_rating
    new_nausea = self.user.nausea + self.attraction.nausea_rating
    new_tickets =  self.user.tickets - self.attraction.tickets

    self.user.update(
      :happiness => new_happiness,
      :nausea => new_nausea,
      :tickets => new_tickets
    )
    self.user.save
    "Thanks for riding the #{self.attraction.name}!"
  end


end
