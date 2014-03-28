class GameController
  def self.start(argv, list)
    command = argv.shift
    task = argv.join(" ")

    case command
      when "list"
        list.list
      when "add"
        list.add(task)
        list.list
      when "delete"
        task_id = task.to_i - 1
        list.delete(task_id)
        list.list
      when "complete"
        task_id = task.to_i - 1
        list.complete(task_id)
        list.list
      else
        puts "Please give us a command!"
        puts "list/add/delete/complete"
    end
  end
end