class Game < ActiveRecord::Base
  belongs_to :player
  belongs_to :day


  attr_accessor :player, :day

#   module Create_Scores
#     def self.write_and_generate
#     #grab high scores

#     database_array = $db.execute("SELECT name, scores, difficulty
#                                   FROM high_scores
#                                   ORDER BY scores DESC
#                                   LIMIT 1");
#     Person.new(database_array)
#     end
#   end



#   def initialize(txtfile = 'flashcards_samples.txt', players)
#     @txtfile = txtfile
#     if txtfile == 'flashcards_easy.txt'
#       deck_choice = 'easy'
#     else
#       deck_choice = 'hard'
#     end
#     @flash_cards = []
#     @definitions = []
#     @terms = []
#     create_hash
#     @players = players
#     @players.map! do |player|
#       Player.new(player, deck_choice)
#     end
#     # player_amount.times { players << Player.new }
#   end

#   def create_hash
#     big_array = File.readlines(@txtfile).join("").split("\n")
#     big_array.delete("")
#     big_array.each_with_index do |element, index|
#       index.even? ? @definitions << element : @terms << element
#     end
#     @definitions.each_with_index do |definition, index|
#       @flash_cards << {definition => @terms[index]}
#     end
#     @flash_cards.shuffle!
#   end

#   def insert_and_get_scores
#     $db = SQLite3::Database.open("high_scores.db")
#     #write all players to file

#     @players.each do |player|
#       $db.execute("INSERT INTO high_scores(name, scores, difficulty)
#       VALUES (?,?,?)", player.name, player.score, player.deck)
#     end
#     return array_highscores_person_object = Create_Scores.write_and_generate
#   end
end