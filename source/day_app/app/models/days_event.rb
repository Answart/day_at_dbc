# require_relative '../db/config/application'

class DaysEvent < ActiveRecord::Base
  belongs_to :day
  belongs_to :event

  before_save :change_user_attribute
  validates :day_id, :presence => true
  validates :event_id, :presence => true


  def change_user_attribute
    player = self.day.player

  end
end