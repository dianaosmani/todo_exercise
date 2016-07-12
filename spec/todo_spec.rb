require "spec_helper"
require "pry"

describe "Todo" do 

  let(:todo1) {Todo.new('Remember the Milk', "2000-10-10")}
  let(:todo2) {Todo.new("Buy a Newspaper", "2000-11-10")}
  let(:contains) {'Milk'}
  let(:exactly) {'Remember the Milk'}
  # @@todos_array = [:todo1, :todo2]
# before do
#   todo = Todo.new("Remember the Milk", "2000-10-10")
# end

before (:each) do 
  Todo.clear
end

  it "should be able to create a new todo item" do 

    todo1 = Todo.new("Remember the Milk", "2000-10-10")

    expect(todo1.title).to eq ('Remember the Milk')
    expect(todo1.due_date).to eq Date.parse("2000-10-10")

  end 

  it "should set default date to today" do 

    todo2 = Todo.new("Buy a Newspaper")
    expect(todo2.due_date).to eq Date.today

  end
  
  it "should accept date objects for the date" do 
    
    todo1 = Todo.new("Remember the Milk", "2000-10-10")
    expect(todo1.due_date).to be_a(Date)
  
  end
  
  it "should print all Todos" do 
    
    # todo1
    # todo2
    expect(Todo.all).to eq [todo1, todo2] 
  
  end

  it "should print the latest Todo" do 
  todo1
  todo2
  expect(Todo.last).to eq todo2
  end

  it "should find Todos with words containing 'Milk'" do
    expect(Todo.find contains: "Milk").to eq todo1
  end

  it "should find Todos with words exactly 'Remember the Milk'" do 

    expect(Todo.find exactly:"Remember the Milk").to eq todo1
  end


end