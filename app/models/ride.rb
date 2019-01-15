class Ride < ActiveRecord::Base
  belongs_to :attraction
  belongs_to :user

  def take_ride
    @user = self.user
    @attraction = self.attraction
    if not_enough_tickets && too_short
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
    elsif not_enough_tickets
      return "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
    elsif too_short
      return "Sorry. You are not tall enough to ride the #{@attraction.name}."
    else
      update_user
    end
  end

  def too_short
    @user.height < @attraction.min_height
  end

  def not_enough_tickets
    @user.tickets < @attraction.tickets
  end

  def update_user
    new_ticket_count = @user.tickets - @attraction.tickets
    new_nausea_value = @user.nausea + @attraction.nausea_rating
    new_happiness_value = @user.happiness + @attraction.happiness_rating
    @user.update(:tickets => new_ticket_count, :nausea => new_nausea_value, :happiness => new_happiness_value)
  end
end
