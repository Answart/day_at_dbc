require_relative '../../config/application'

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points, :energy, :integrity, default: 0
      t.integer :day_id
      t.integer :day_number, default: 0

      t.timestamps
    end
  end
end