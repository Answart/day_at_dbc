class Task
  attr_reader :description
  attr_accessor :completed

  def initialize(description, completed=false)
    @description = description
    @completed = completed
  end
end