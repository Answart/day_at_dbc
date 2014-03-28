require_relative '../../config/application'

class CreateDaysEvents < ActiveRecord::Migration
  def change
    create_table :days_events do |t|
      t.belongs_to :day # t.references :day
      t.belongs_to :event # :null => false# t.references :event
      t.boolean :completed, default: false

      # t.integer :energy
      # t.integer :integrity
    end
  end
end