


class View

attr_reader :player

  def self.intro
    puts "Welcome to A Day at DBC!. To play, just enter your name.  Ready?  Go!\n"
    sleep(0.3)
  end

  def self.which_player
    puts "-"*50
    puts "What is your name?"
    name = gets.chomp! # returns name (attribute of player in db)
    puts "-"*50
    name
  end

  def self.welcome(player)
    puts "Welcome #{player.name}. Let's start a new day!"
    puts "-"*20
    current_stats(player)
    puts "\n"
    sleep(0.3)
  end

  def self.current_stats(player)
    puts "Your current stats are:\n-- Points: #{player.points}\n-- Integrity: #{player.integrity}\n-- Energy: #{player.energy}"
  end

  def self.goodbye(player)
    puts "Congradulations! You've finished your day!"
    puts ""
    puts "Go to bed!"
    player.energy += 5
    current_stats(player)
  end
end













#   def self.chosen_deck(decision)
#     if decision == "easy"
#       chosen = 'flashcards_easy.txt'
#     elsif decision == "hard"
#       chosen = 'flashcards_samples.txt'
#     else
#       puts "Please choose a deck to play from the options above"
#       which_deck
#     end
#     puts "You have chosen #{chosen}! Good luck!"
#     return chosen
#   end

#  def self.number_of_players
#     puts "How many players do you have?"
#     number_players = gets.chomp.to_i
#     players = []
#     counter = 1
#     number_players.times do
#       puts "Enter name for player #{counter}:"
#          players << gets.chomp.to_s
#          counter += 1
#     end
#     return players
#   end

#   def self.continue_game(definition)
#     puts "\nDefinition: \n#{definition}"
#     gets.chomp
#   end

#   def self.show_points(score)
#     puts "Your current points are: #{score}.\n"
#   end

#   def self.start_challenge_deck(name)
#     puts "\n"
#     puts "-"*50
#     puts "Hey #{name}! Lets play the questions you missed!"
#     puts "-"*50
#   end

#   def self.final_score(score)
#     puts "Your final score is #{score}.\n"
#   end

#   def self.display_correct_answer(word)
#     puts "Too many tries! The correct answer is #{word}."
#   end

#   def self.correct_answer
#     puts " -- Correct!\n"
#   end

#   def self.incorrect_answer
#     puts " -- Incorrect! Try again:"
#   end

#   def self.game_over
#     puts "Thanks for playing!"
#   end

#   def self.display_scores(player)
#     puts "#{player.name.upcase}:#{player.score}"
#   end
# end