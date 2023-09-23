class Originator
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def create_memento
    Memento.new(@state)
  end

  def restore_memento(memento)
    @state = memento.state
  end

  def show_state
    puts "Стан об'єкта: #{@state}"
  end
end

class Memento
  attr_reader :state, :timestamp

  def initialize(state)
    @state = state
    @timestamp = Time.now
  end
end

class Caretaker
  attr_accessor :mementos

  def initialize
    @mementos = []
  end

  def add_memento(memento)
    @mementos << memento
  end

  def get_memento(index)
    @mementos[index]
  end
end

originator = Originator.new("Початковий стан")
caretaker = Caretaker.new

originator.show_state

memento1 = originator.create_memento
caretaker.add_memento(memento1)
puts "Збережено стан об'єкта на часі #{memento1.timestamp}"

originator.state = "Новий стан"
originator.show_state

memento2 = originator.create_memento
caretaker.add_memento(memento2)
puts "Збережено новий стан об'єкта на часі #{memento2.timestamp}"

originator.restore_memento(caretaker.get_memento(0))
originator.show_state
puts "Відновлено попередній стан об'єкта на часі #{caretaker.get_memento(0).timestamp}"