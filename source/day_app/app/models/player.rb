class Player < ActiveRecord::Base
  has_many :days

  # self.integrity
  # player.days_events.sum

  attr_accessor :name, :day_number

  # called when a player is created, it creates a new day (which leads to a 4 day_events)
  def self.create_day
    Day.new()
  end

  def assign_number
  end
end