class BeatBox
  attr_reader :list

  VALID_BEATS = %w[tee dee deep bop boop la na doo ditt woo hoo shu].freeze

  def initialize(data = nil)
    @list = LinkedList.new
    append(data) if data
  end

  def append(data)
    formatted(data).each do |data|
      @list.append(data) if valid_beat?(data)
    end
  end

  def prepend(data)
    formatted(data).reverse.each do |data|
      @list.prepend(data) if valid_beat?(data)
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
    puts "Playing: #{beats}"
  end

  private

  def formatted(data)
    data.split
  end

  def valid_beat?(beat)
    VALID_BEATS.include?(beat)
  end
end