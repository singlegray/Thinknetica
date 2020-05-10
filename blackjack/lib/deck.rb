# frozen_string_literal: true

require_relative 'card'

class Deck
  attr_reader :cards

  def initialize
    @cards = []
    Card::VALUES.each do |value|
      Card::SUITS.each do |suit|
        @cards << Card.new(value, suit)
      end
    end
  end

  def shuffle
    @cards = @cards.shuffle
  end
end
