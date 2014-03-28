# require_relative '../db/config/application'

class Day < ActiveRecord::Base
  has_many :days_events
  belongs_to :player
end