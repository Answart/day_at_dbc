require_relative '../../config/application'

class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_number, default: 0
      t.integer :player_id
    end
  end
end