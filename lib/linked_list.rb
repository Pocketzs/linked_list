class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    @head = Node.new(data)
  end

  def count
    1
  end

  def to_string
    @head.data
  end
end