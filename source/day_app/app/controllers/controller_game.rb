class GameController

attr_reader :game

  def self.start_game
    View.intro # introduce game
    name = View.which_player # gets a name from player
    player1 = Player.find_or_create_by(first_name: name) # find player object by name, if not there create a new row in Player table with that name
        # => #<Client id: 1, first_name: "Andy", orders_count: 0, locked: true, created_at: "2011-08-30 06:09:27", updated_at: "2011-08-30 06:09:27">
    View.welcome(player1) # welcome back message addressed to player # shows their current stats within welcome
    player1.create_day # Player model makes a new day(inserts day_id in player table, creates row in day table)
    this_day = player1.day
    go_through_day(player1, this_day)
    View.goodbye
  end

  def self.run_event(player, day, days_event)
    # View.run through first sentence with question
    # player.day.days_event.day[0]


  end

  def self.welcome(player)
    #View.welcome ()
  end

  def go_through_day(player, day, days_event = 1)
    if player.day.days_event.completed == false
      run_event(player, day, days_event)
  end





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



end