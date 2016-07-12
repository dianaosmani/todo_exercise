class Todo 
  attr_accessor :title, :due_date
  @@todos_array = []

  def self.clear
  	@@todos_array
  end

  def self.all
  	return @@todos_array
  end

  def self.last
  	@@todos_array
  end

  def self.find(keyword)
  	@find_array = []
    

  	if keyword [:contains] || keyword [:exactly]
  		@@todos_array.each do |todo|
  			@find_array << todo if todo.title.include? keyword[:contains]
  		end
  		return @find_array 
  		
  	# elsif keyword [:exactly]
  	# 	@@todos_array.each do |todo|
  	# 		@find_array << todo if todo.title.include? keyword[:exactly]
  	# 	end
  	# 	return @find_array 
  	end
  end

  def initialize (title, due_date=Date.today)
    @title = title
    if due_date.is_a? String
      @due_date = Date.parse(due_date)
    elsif due_date.is_a? Date
      @due_date = due_date
    else
      raise ArgumentError, "Please enter a valid date"
    end
     @@todos_array << self

  end
 
end