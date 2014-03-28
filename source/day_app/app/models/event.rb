class Event < ActiveRecord::Base
  has_many :days_events
  has_many :days, through: :days_events

  attr_reader :event_descriptions

  def populate_events
    event_descriptions = []
    File.open('../../db/data/events.txt').each do |line|
      event_descriptions << line
    end
  end
end