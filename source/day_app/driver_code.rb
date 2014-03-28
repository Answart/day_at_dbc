

Game.new

puts "What's your name?"
name = gets.chomp

player = Player.new(name)

# Energy = 10
# Integrity = 5
# Effort = 5

# Event 1 (morning)
puts "You just wake up. It's 8:30am. Check in starts at 8:45am."
puts "Do you decide to eat breakfast or rush to class? (breakfast OR rush)"
morning_answer = gets.chomp
# player.events.create
#


