# frozen_string_literal: true

class Player
  attr_accessor :hand, :coin, :score, :name

  def initialize(name)
    @hand = []
    @coin = 100
    @score = 0
    @name = name
  end
end
