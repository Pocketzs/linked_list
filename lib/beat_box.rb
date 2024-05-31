class BeatBox
  attr_reader :list

  def initialize
    @list = LinkedList.new
  end

  def append(data)
    formatted = data.split
    formatted.each do |data|
      @list.append(data)
    end
  end

  def count
    @list.count
  end

  def all
    @list.to_string
  end

  def play
    beats = all
    `say -r 500 -v Boing #{beats}`
  end
end