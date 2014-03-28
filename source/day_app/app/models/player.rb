# require_relative '../db/config/application'

class Player < ActiveRecord::Base
  has_many :days

  # self.integrity
  # player.days_events.sum
  attr_accessor :name

  # called when a player is created, it creates a new day (which leads to a 4 day_events)
  def self.create_day
    Day.new # has 
  end

  def

  end

end