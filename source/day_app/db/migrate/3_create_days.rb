require_relative '../../config/application'

class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :day_number, :player_id
    end
  end
end