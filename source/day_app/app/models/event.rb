# require_relative '../db/config/application'

class Event < ActiveRecord::Base
  has_many :days_events
end