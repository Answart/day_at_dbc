require_relative '../../config/application'

class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.integer :points, :energy, :integrity

      c.timestamps
    end
  end
end