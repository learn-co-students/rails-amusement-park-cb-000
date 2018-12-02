class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, :through => :rides
  has_secure_password

  validates :name, presence: true
  validates :happiness, presence: true
  validates :nausea, presence: true
  validates :height, presence: true
  validates :tickets, presence: true

  def admin?
    self.admin
  end

  def mood
    self.nausea > self.happiness ? 'sad' : 'happy'
  end

  def too_short_to_ride?(attraction)
    self.height < attraction.min_height ? "You are not tall enough to ride the #{attraction.name}." : nil
  end

  def not_enough_tickets_to_ride?(attraction)
    self.tickets < attraction.tickets ? "You do not have enough tickets to ride the #{attraction.name}." : nil
  end
end
