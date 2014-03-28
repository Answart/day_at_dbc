require_relative '../../config/application'

class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :description
    end
  end
end