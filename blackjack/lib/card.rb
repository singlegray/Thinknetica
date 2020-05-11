# frozen_string_literal: true

class Card
  attr_reader :value, :suit

  VALUES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'J', 'Q', 'K', 'A'].freeze
  SUITS = %w[♠ ♥ ♦ ♣].freeze

  def initialize(value, suit)
    @value = value
    @suit = suit
  end

  def score
    return 11 if @value == 'A'
    return 10 if %w[J Q K].include? @value

    @value
  end

  def disp
    "#{@value}#{@suit}"
  end
end
