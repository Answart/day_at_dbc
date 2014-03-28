# require_relative '../db/config/application'

class DaysEvent < ActiveRecord::Base
  belongs_to :day
  belongs_to :event

  # before_save :change_user_attribute
  validates :day_id, :presence => true
  validates :event_id, :presence => true

  attr_accessor :day_id, :event_id

  def create()
    
  def change_user_attribute
    player = self.day.player

  end
end





=begin

module Create_Scores
  def self.write_and_generate
  #grab high scores

  database_array = $db.execute("SELECT name, scores, difficulty
                                FROM high_scores
                                ORDER BY scores DESC
                                LIMIT 8");
  database_array.map {|eachplayer| Person.new(eachplayer[0], eachplayer[1], eachplayer[2])}
  end
end





module GameFactory
  def self.create_game

  end

  def self.create_player # create a game
    $db.execute("CREATE TABLE IF NOT EXISTS player(
      id INTEGER PRIMARY KEY ASC,
      name VARCHAR NOT NULL,
      scores INTEGER NOT NULL,
      difficulty VARCHAR NOT NULL)")
  end

  def self.add_point #
    $db.execute("UPDATE TABLE players(
      SET scores = scores + 1
      WHERE id = 1")
  end
  # UPDATE choices SET votes=votes + 1 WHERE poll_id=? AND choice_id=
  # https://stackoverflow.com/questions/744289/sqlite-increase-value-by-a-certain-number

  def self.add_point #
    $db.execute("UPDATE TABLE players(
      SET scores = scores - 1
      WHERE id = 1")
  end

end





class Game
  include Create_Scores
  attr_accessor :players, :flash_cards

  def initialize(txtfile = 'flashcards_samples.txt', players)
    @txtfile = txtfile
    if txtfile == 'flashcards_easy.txt'
      deck_choice = 'easy'
    else
      deck_choice = 'hard'
    end
    @flash_cards = []
    @definitions = []
    @terms = []
    create_hash
    @players = players
    @players.map! do |player|
      Player.new(player, deck_choice)
    end
    # player_amount.times { players << Player.new }
  end

  def create_hash
    big_array = File.readlines(@txtfile).join("").split("\n")
    big_array.delete("")
    big_array.each_with_index do |element, index|
      index.even? ? @definitions << element : @terms << element
    end
    @definitions.each_with_index do |definition, index|
      @flash_cards << {definition => @terms[index]}
    end
    @flash_cards.shuffle!
  end

  def insert_and_get_scores
    $db = SQLite3::Database.open("high_scores.db")
    #write all players to file

    @players.each do |player|
      $db.execute("INSERT INTO high_scores(name, scores, difficulty)
      VALUES (?,?,?)", player.name, player.score, player.deck)
    end
    return array_highscores_person_object = Create_Scores.write_and_generate
  end
end




class Player
  attr_accessor :challenge_deck, :score, :name, :deck
  def initialize(name, deck_choice)
    @score = 0
    @challenge_deck = []
    @name = name
    @deck = deck_choice   #this needs to be changed to player choice
  end
end




class Person
  attr_accessor  :score, :name, :difficulty
  def initialize (name, scores, difficulty)
    @name = name
    @score = scores
    @difficulty = difficulty
  end
end



=end