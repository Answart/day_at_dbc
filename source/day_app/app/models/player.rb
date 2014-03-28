# require_relative '../db/config/application'

class Player < ActiveRecord::Base
  has_many :days

  # self.integrity
  # player.days_events.sum
end