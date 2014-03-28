

=begin

>> first_day
#<Day id: 2, day_number: nil, player_id: 2>
>> first_day.user
NoMethodError: undefined method `user' for #<Day id: 2, day_number: nil, player_id: 2>
  from /Users/apprentice/.rvm/gems/ruby-1.9.3-p448/gems/activemodel-4.0.4/lib/active_model/attribute_methods.rb:439:in `method_missing'
  from /Users/apprentice/.rvm/gems/ruby-1.9.3-p448/gems/activerecord-4.0.4/lib/active_record/attribute_methods.rb:167:in `method_missing'
  from (irb):20
  from /Users/apprentice/.rvm/rubies/ruby-1.9.3-p448/bin/irb:16:in `<main>'
>> first_day.player
#<Player id: 2, name: nil, points: nil, energy: nil, integrity: nil>
>> @player1.days.first
#<Day id: 2, day_number: nil, player_id: 2>
>> first_day.days_events
#<ActiveRecord::Associations::CollectionProxy []>
>> first_day.days_events.create(event_id: 1)
#<DaysEvent id: 2, day_id: 2, event_id: 1, completed: nil>
>> first_day.days_events.create(event_id: 2)
#<DaysEvent id: 3, day_id: 2, event_id: 2, completed: nil>
>> first_day.days_events.create(event_id: 3)
#<DaysEvent id: 4, day_id: 2, event_id: 3, completed: nil>
>> @player
nil
>> @player1
#<Player id: 2, name: nil, points: nil, energy: nil, integrity: nil>
>> @player1.days
#<ActiveRecord::Associations::CollectionProxy [#<Day id: 2, day_number: nil, player_id: 2>, #<Day id: 3, day_number: nil, player_id: 2>]>
>> @player1.days.first
#<Day id: 2, day_number: nil, player_id: 2>
>> @player1.days.first.days_events
#<ActiveRecord::Associations::CollectionProxy [#<DaysEvent id: 2, day_id: 2, event_id: 1, completed: nil>, #<DaysEvent id: 3, day_id: 2, event_id: 2, completed: nil>, #<DaysEvent id: 4, day_id: 2, event_id: 3, completed: nil>]>
>> @player1.days.first.days_events
#<ActiveRecord::Associations::CollectionProxy [#<DaysEvent id: 2, day_id: 2, event_id: 1, completed: nil>, #<DaysEvent id: 3, day_id: 2, event_id: 2, completed: nil>, #<DaysEvent id: 4, day_id: 2, event_id: 3, completed: nil>]>
>> @player1.days.first.days_events.first
#<DaysEvent id: 2, day_id: 2, event_id: 1, completed: nil>
>> @player1.days.first.days_events.first.event
#<Event id: 1, description: nil>
>> @player1.days_events
NoMethodError: undefined method `days_events' for #<Player:0x007fb69b027098>
  from /Users/apprentice/.rvm/gems/ruby-1.9.3-p448/gems/activemodel-4.0.4/lib/active_model/attribute_methods.rb:439:in `method_missing'
  from /Users/apprentice/.rvm/gems/ruby-1.9.3-p448/gems/activerecord-4.0.4/lib/active_record/attribute_methods.rb:167:in `method_missing'
  from (irb):35
  from /Users/apprentice/.rvm/rubies/ruby-1.9.3-p448/bin/irb:16:in `<main>'
>> @player1.days
#<ActiveRecord::Associations::CollectionProxy [#<Day id: 2, day_number: nil, player_id: 2>, #<Day id: 3, day_number: nil, player_id: 2>]>
>> @player1.days.first
#<Day id: 2, day_number: nil, player_id: 2>
>> day =_
#<Day id: 2, day_number: nil, player_id: 2>
>> day.days_events
#<ActiveRecord::Associations::CollectionProxy [#<DaysEvent id: 2, day_id: 2, event_id: 1, completed: nil>, #<DaysEvent id: 3, day_id: 2, event_id: 2, completed: nil>, #<DaysEvent id: 4, day_id: 2, event_id: 3, completed: nil>]>


=end