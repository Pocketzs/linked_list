class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    if @head
      find_tail.next_node = Node.new(data)
    else
      @head = Node.new(data)
    end
  end

  def find_tail
    current = @head
    current = current.next_node while current.next_node
    current
  end

  def count
    current = @head
    count = 0
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def to_string
    current = @head
    data = []
    while current
      data << current.data
      current = current.next_node
    end
    data.join(" ")
  end
end