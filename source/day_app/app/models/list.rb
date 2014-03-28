class List
  def initialize(file)
    @file = file            # store the file selection
    @tasks = []             # store the tasks
    file_is_csv? ? load_csv_into_tasks : load_file_into_tasks
  end

  def list
    @tasks.each_with_index do |task, index|
      print pad_index(index + 1)
      print '['
      print (task.completed == true ? 'X' : ' ')
      print ']'
      print ' '
      puts "#{task.description}"
    end
  end

  def add(description)
    @tasks << Task.new(description)
    update
  end

  def delete(task_id)
    @tasks.delete_at(task_id)
    update
  end

  def complete(task_id)
    @tasks[task_id].completed = true
    update
  end

  private

  def pad_index(index)
    length = @tasks.length.to_s.length + 1
    output = index.to_s + '.'
    output.ljust(length + 1)
  end

  def file_is_csv?
    filename = @file.match(/(?<filename>.*)\.(?<extension>.*)/)
    filename[:extension] == "csv"
  end

  def load_csv_into_tasks
    CSV.foreach(File.path(@file)) do |col|
      description = col[0]
      completed   = (col[1] == "true" ? true : false)
      @tasks << Task.new(description, completed)
    end
  end

  def load_file_into_tasks
    tasks = File.readlines(@file)

    tasks.each do |task|
      info = task.match(/^(?<id>\d+)\s*\.\s*\[(?<completed>.*?)\]\s*(?<description>.*?)$/)

      id          = info[:id]
      completed   = info[:completed]
      description = info[:description]

      id          = id.to_i - 1
      completed   = completed.include?('X') ? true : false

      @tasks[id] = Task.new(description, completed)
    end
  end

  def update
    file_is_csv? ? update_csv : update_file
  end

  def update_csv
    CSV.open(@file, "wb") do |csv| # w is overwrite, #b is for binary file mode
      @tasks.each do |task|
        output = [task.description, task.completed]
        csv << output
      end
    end
  end

  def update_file
    File.open(@file, "wb") do |file|
      @tasks.each_with_index do |task, index|
        output = "#{pad_index(index + 1)}"
        output << "[#{task.completed == true ? 'X' : ' '}] #{task.description}"
        output << "\n"
        file << output
      end
    end
  end
end