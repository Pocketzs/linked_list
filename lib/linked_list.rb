class LinkedList
  attr_reader :head

  def initialize(head = nil)
    @head = head
  end

  def append(data)
    # @head ? @head.next_node = Node.new(data) : @head = Node.new(data)
    if @head
      current = @head
      while current.next_node
        current = current.next_node
      end
      current.next_node = Node.new(data)
    else
      @head = Node.new(data)
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
end