class Card
  attr_reader :rank, :suit

  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = %w[♠ ♥ ♦ ♣].freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def to_s
    "#{@value}#{@suit}"
  end

  def ace?
    @value == 'A'
  end

  def score
    return 11 if @value == 'A'
    return 10 if %w[J Q K].include? @value
    @value
  end
end