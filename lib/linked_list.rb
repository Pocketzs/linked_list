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
    return prepend(data) if position.zero?
    new_node = Node.new(data)
    previous = find_node_at(position - 1)
    if previous
      new_node.next_node = previous.next_node
      previous.next_node = new_node
    else
      append(data)
    end
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

  def find(position, length)
    elements = to_string.split
    elements[position, length].join(" ")
  end

  private

  def find_node_at(position)
    current = @head
    (position).times do
      return nil unless current.next_node
      current = current.next_node
    end
    current
  end

  def find_tail
    current = @head
    current = current.next_node while current.next_node
    current
  end
end