require 'csv'
require_relative 'config/application'
require_relative 'app/models/task'
require_relative 'app/models/list'
# require_relative 'app/views/view'
require_relative 'app/controllers/controller_game'

puts "Put your application code in #{File.expand_path(__FILE__)}"

list = List.new("db/data/todo.csv")
argv = ARGV.dup

GameController.start(argv, list)