require_relative '../../config/application'

class CreateDaysEvents < ActiveRecord::Migration
  def change
    create_table :days_events do |t|
      t.integer :day_id #,  # t.references :day
      t.integer :event_id #,  :null => false# t.references :event
      t.boolean :completed
      t.integer :integrity
    end
  end
end