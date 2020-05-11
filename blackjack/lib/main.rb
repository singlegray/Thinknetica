# frozen_string_literal: true

require_relative 'deck'
require_relative 'player'
require_relative 'interface'
require_relative 'computer'
require_relative 'human'
require_relative 'card'

class Main
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
    @players.each { |player| player.player_take_card(@deck, 2) }
  end

  def make_bet
    @players.each { |player| player.coin - 10 }
  end

  def make_move_comp
    @dealer.player_take_card(@deck, 1) if @dealer.score <= 17
  end

  def getting_str_hand(player)
    str = ''
    player.hand.each { |i| str += " #{i.disp}" }
    str += " score #{player.score}"
  end

  def winner
    if (@player.score >= @dealer.score && @player.score <= 21) || @dealer.score > 21
      change_coin(@player, @dealer)
      return @player
    elsif (@player.score < @dealer.score && @dealer.score <= 21) || @player.score > 21
      change_coin(@dealer, @player)
      return @dealer
    end
    return nill
  end

  def change_coin(win, lose)
    win.coin += 10
    lose.coin -= 10
  end

  def discharge
    @dealer.score = 0
    @dealer.hand = []
    @player.score = 0
    @player.hand = []
  end
end
