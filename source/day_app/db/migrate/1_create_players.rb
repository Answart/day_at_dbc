require_relative '../../config/application'

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points
      t.integer :energy
      t.integer :integrity
    end
  end
end