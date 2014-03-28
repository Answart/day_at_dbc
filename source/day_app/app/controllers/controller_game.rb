require_relative '../../config/application'

class GameController

attr_reader :game

  def self.start_game
    View.intro # introduce game
    name = View.which_player # gets a name from player
    @player1 = Player.find_or_create_by(name: name) # find player object by name, if not there create a new row in Player table with that name
        # => #<Client id: 1, first_name: "Andy", orders_count: 0, locked: true, created_at: "2011-08-30 06:09:27", updated_at: "2011-08-30 06:09:27">
    View.welcome(@player1) # welcome back message addressed to player # shows their current stats within welcome
    @player1.days.create # Player model makes a new day(inserts day_id in player table, creates row in day table)
    go_through_day(@player1)

    View.goodbye(@player1)
  end

  def self.go_through_day(player)
    p "Player: #{player}"
    p "Player's days: #{player.days}"
    p "Player's latest day: #{player.days.last}"
    p "The events of player's latest day: #{player.days.last.events}"
    this_days_event = player.days.last.events

    this_days_event.each do |event_line|
      event1_choice if this_days_event == 1 && this_days_event.completed == false #  puts "You have just woken up. It's 08:30 and it's 30 minutes until class! What do you do? Do you 'eat' breakfast or 'rush' to class?"
      event2_choice if this_days_event == 2 && this_days_event.completed == false
      event3_choice if this_days_event == 3 && this_days_event.completed == false
      event4_choice if this_days_event == 4 && this_days_event.completed == false
    end
  end

  def event1_choice
    event1_input = gets.chomp
    if event1_input.downcase == "eat"
      puts "Mmmmm! Tofu scramble and coffee."
      change_player_stats(energy += 2, integrity -= 3)
    elsif event1_input.downcase == "rush"
      puts "GOGOGO! You made it just on time!"
      change_player_stats(energy -= 1, integrity += 1)
    end
    View.current_stats(@player1)
    @player1.day.days_event[:completed] = true
  end

  def event2_choice
    if @player1.energy <= 5
      puts "You fall asleep during lecture..."
      @player1.integrity -= 2
      @player1.energy += 1
    else
      puts "You learn from AHA moments and retain at least 80% of lecture!"
      @player1.points += 2
      @player1.integrity += 1
      @player1.energy -= 1
    end
    View.current_stats(@player1)
    @player1.day.days_event[:completed] = true
  end

  def event3_choice
    event3_input = gets.chomp
    if event3_input.downcase == "solo"
      @player1.points += 2
      @player1.integrity -= 1
      @player1.energy -= 1
    elsif event3_input.downcase == "pair"
      change_player_stats(points += 2, integrity +=1 , energy -= 2)
    end
    @player1.code... #update code
    View.current_stats(@player1)
    @player1.day.days_event[:completed] = true
  end

  def event4_choice
    event4_input = gets.chomp
    if event4_input=='yes'
      change_player_stats(pionts += 1, energy -= 2, integrity += 1)
    else
      end_day
      change_player_stats(energy += 2)
    end
    View.current_stats(@player1)
    @player1.day.days_event[:completed] = true
  end

  # def self.welcome(player)
  #   #View.welcome ()
  # end
end

  # def go_through_day(player, day, days_event = 1)
  #   if player.day.days_event.completed == false
  #     run_event(player, day, days_event)
  # end





# Event2.description1
# def event2_storyline
#   puts "*gooooooong!* Time for the morning meeting. \"SKIPPERS TO THE CAAVE!\" You listen to the morning check-in with Brick and Strand"
# end


# Event3.description1
# def event3_storyline
#   puts "Go forth and code! Do you want to pair, or go solo today?"
# end

# Event4.description1
# def event4_storyline
#   puts "It's 6:30PM. You've done some great coding today! Do you want to stay to continue coding?"
# end












  # def self.start_game
  #   View.welcome
  #   textfile = View.which_deck
  #   @game = Game.new(textfile, View.number_of_players)
  #   @deck = @game.flash_cards
  #   @current_attempt = 0
  #   @game.players.each_with_index do |player, index|
  #     @player = player
  #     puts "-"*50
  #     puts "Player #{player.name} is about to play the game!\n"
  #     @deck_copy = @deck.dup
  #     @challenge_deck = []
  #     next_question(@deck_copy, @attempts_allowed = 2, @deck.first.keys[0], point_value = 4)
  #     @challenge_deck = @player.challenge_deck.dup
  #     challenge_deck(@challenge_deck, @attempts_allowed = 0, @player.challenge_deck[0].keys[0], point_value = 3) unless @player.challenge_deck != nil
  #   end
  #   puts "\n"*2
  #   final_players
  #   display_high_scores
  # end

  # def self.check_answer(deck, attempts_allowed, user_answer, point_value)
  #   return if deck.empty? #end this vicious cycle!
  #   if @attempts_allowed == 0
  #     p "#{attempts_allowed}"
  #     View.display_correct_answer(deck.first.values[0])
  #     @player.challenge_deck << deck.shift
  #     View.show_points(@player.score)
  #     if @challenge_deck.empty?
  #       @attempts_allowed = 2
  #       p "#{@challenge_deck}"
  #     else
  #       @attempts_allowed = 0
  #     end
  #     next_question(deck, attempts_allowed, deck.first.keys[0], point_value = 4) unless deck.empty?
  #   elsif user_answer.upcase == deck.first.values[0].upcase
  #     View.correct_answer
  #     deck.shift
  #     @player.score += point_value
  #     View.show_points(@player.score)
  #     @attempts_allowed = 2
  #     next_question(deck, attempts_allowed, deck.first.keys[0], point_value = 4) unless deck.empty?
  #   else
  #     View.incorrect_answer
  #     View.show_points(@player.score)
  #     @attempts_allowed -= 1
  #     next_question(deck, attempts_allowed, deck.first.keys[0], point_value -= 1)
  #   end
  # end

  # def self.final_players
  #   @game.players.each do |player|
  #     puts "Player #{player.name}:" # change player to player.name
  #     View.final_score(player.score)
  #   end
  # end

  # def self.next_question(deck, attempts_allowed, definition, point_value)
  #   user_input = View.continue_game(definition)
  #   check_answer(deck, attempts_allowed, user_input, point_value)
  # end

  # def self.challenge_deck(deck, attempts_allowed, definition, point_value)
  #   View.start_challenge_deck(@player.name)
  #   user_input = View.continue_game(definition)
  #   check_answer(deck, attempts_allowed, user_input, point_value)
  # end

  # def self.display_high_scores
  #   all_player_objects=@game.insert_and_get_scores
  #   puts "\nTop all time hard scores are..... "
  #   all_player_objects.select {|player|
  #     player.difficulty == 'hard'}.each {|player| View.display_scores(player)}
  #     sleep(0.2)

  #   puts "\nTop all time easy scores are..... "
  #     all_player_objects.select {|player|
  #       player.difficulty == 'easy'}.each {|player| View.display_scores(player)}
  #     sleep(0.2)
  # end


