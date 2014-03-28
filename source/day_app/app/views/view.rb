require_relative '../models/list'

def current_player_stats
  "You have #{Player.energy} Energy, #{Player.points} Points and #{Player.blah} Blah!" #SHOW CURRENT STATS (in string form)
end

def event1_storyline
  puts "You have just woken up. It's 08:30 and it's 30 minutes until class!"
  puts ""
  puts "What do you do? Do you 'eat' breakfast or 'rush' to class?"
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
  current_player_stats
end


def event2_storyline
  puts "*gooooooong!* Time for the morning meeting. \"SKIPPERS TO THE CAAVE!\""
  puts ""
  puts "You listen to the morning check-in with Brick and Strand"
end

def event2_choice
  if Player.energy <= 5
    puts "You fall asleep during lecture..."
    Player.integrity -= 2
    Player.energy += 1
  else
    puts "You learn from AHA moments and retain at least 80% of lecture!"
    Player.points += 2
    Player.integrity += 1
    Player.energy -= 1
  end
  current_player_stats
end

def event3_storyline
  puts "Go forth and code!"
  puts ""
  puts "Do you want to pair, or go solo today?"
end

def event3_choice
  event3_input = gets.chomp
  if event3_input.downcase == "solo"
    Player.points += 2
    Player.integrity -= 1
    Player.energy -= 1
  elsif event3_input.downcase == "pair"
    change_player_stats(points += 2, integrity +=1 , energy -= 2)
  end
  Player.code... #update code
  current_player_stats
end


def event4_storyline
  puts "It's 6:30PM. You've done some great coding today!"
  puts "Do you want to stay to continue coding?"
end

def event4_choice
  event4_input = gets.chomp
  if 'yes'
    change_player_stats(pionts += 1, energy -= 2, integrity += 1)
  elsif 'no'
    end_day
    change_player_stats(energy += 2)
  end
  current_player_stats
end

def eod_dialog
  puts "Congradulations! You've finished your day!"
  puts ""
  puts "Go to bed!"
  Player.energy += 5
  current_player_stats
end

