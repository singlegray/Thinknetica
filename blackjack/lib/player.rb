# frozen_string_literal: true

class Player
  attr_accessor :hand, :coin, :score, :name

  def initialize(name)
    @hand = []
    @coin = 100
    @score = 0
    @name = name
  end

  def player_take_card(deck, count = 1)
    return if hand.size >= 3
    count.times do
      card = deck.cards.pop
      @hand.push(card)
      @score += card.score
    end
  end
end
