# require_relative '../db/config/application'

class Day < ActiveRecord::Base
  has_many :days_events
  belongs_to :player

  attr_accessor :day_number

  def self.new_day
    # creates row in day table associated with player_id
    @day_number = # current day number Time.now for day and month
    create_events # creates 4 new days_events associated with player_id and this new day_id
  end

  def self.create_events
    # creates 4 new days_events associated with player_id and this new day_id
  end
end


 # creates 
    # iterate through static rows in events table to make 4 new rows in days_events table based on static Events table
    # (days_events row now has access to player1.day1 to insert player_id and day_id when it is created)