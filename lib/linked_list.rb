class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    new_node = Node.new(data)
    if @head
      find_tail.next_node = new_node
    else
      @head = new_node
    end
  end

  def prepend(data)
    new_node = Node.new(data)
    new_node.next_node = @head
    @head = new_node
  end

  def insert(position, data)
    new_node = Node.new(data)
    current = @head
    (position-1).times do
      current = current.next_node
    end
    new_node.next_node = current.next_node
    current.next_node = new_node
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