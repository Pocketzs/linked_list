class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    @head ? @head.next_node = Node.new(data) : @head = Node.new(data)
  end

  def count
    current_node = @head
    count = 0
    while current_node
      count += 1
      current_node = current_node.next_node
    end
    count
  end

  def to_string
    current_node = @head
    data = []
    while current_node
      data << current_node.data
      current_node = current_node.next_node
    end
    data.join(" ")
  end
end