# frozen_string_literal: true

class Main
  require_relative 'deck'
  require_relative 'player'
  require_relative 'interface'
  require_relative 'computer'
  require_relative 'human'
  require_relative 'card'

  attr_accessor :deck, :players, :player, :dealer

  def initialize
    @deck = Deck.new
    @players = []
  end

  def set_computer
    @dealer = Computer.new
    @players.push(@dealer)
  end

  def set_user(name)
    @player = Human.new(name)
    @players.push(@player)
  end

  def deals_card
    @players.each { |player| player_take_card(player, 2) }
  end

  # игрок берет карту на руку
  def player_take_card(player, count = 1)
    count.times do
      card = @deck.cards.pop
      player.hand.push(card)
      player.score += card.score
    end
  end

  # вскрытие карт подсчет очков
  def open_card
    @players.each { |player| puts player.score }
  end

  # сделать ставку
  def make_bet()
    @players.each { |player| player.score - 10 }
  end

  def make_move_comp
    player_take_card(@players[0], 1) if @players[0].score > 17
  end
end
