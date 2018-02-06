class User < ActiveRecord::Base
  has_secure_password
  has_many :rides
  has_many :attractions, through: :rides
  after_initialize :after_init

  def after_init
    self.admin ||= false
  end

  def mood
    if self.nausea? && self.happiness?
      if self.nausea > self.happiness
        "sad"
      else
        "happy"
      end
    end
  end
end

