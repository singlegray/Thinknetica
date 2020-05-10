# frozen_string_literal: true

class Interface
  require_relative 'main'

  def initialize
    @game = Main.new
  end

  def main_menu
    puts '1 - New game'
    puts '2 - Exit'
  end

  def menu
    puts ''
    puts '1 - Add'
    puts '2 - Show'
    puts '3 - Skip'
  end

  def clear_terminal
    system('cls')
  end

  def show_hand(player)
    puts "#{player.name} your card"
    player.hand.each { |i| print "#{i.disp} " }
  end

  def get_name
    puts "Enter your name"
    gets.chomp
  end

  # game
  def start
    @game.set_computer
    @game.set_user(get_name)
    clear_terminal
    @game.deck.shuffle
    @game.deals_card
    @game.make_bet
    show_hand(@game.player)
    loop do
      menu
      case gets.to_i
      when 1
        clear_terminal
        @game.player_take_card(@game.player, 1)
        show_hand(@game.player)
        @game.make_move_comp
      when 2
        clear_terminal
        @game.open_card
      when 3
        @game.make_move_comp
      end
    end
  end
end
