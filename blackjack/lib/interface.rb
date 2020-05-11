# frozen_string_literal: true

require_relative 'main'

class Interface

  def initialize
    @game = Main.new
  end

  def main_menu
    puts '1 - New game'
    puts '2 - Exit'
  end

  def game_menu
    puts ''
    puts '1 - Add'
    puts '2 - Skip'
    puts '3 - Show'
  end

  def return_menu
    puts '1 - Continued'
    puts '2 - New game'
    puts '3 - Exit'
  end

  def clear_terminal
    system('cls')
  end

  def show_hand(player)
    puts "#{player.name} card"
    puts @game.getting_str_hand(player)
  end

  def get_name
    puts "Enter your name"
    gets.chomp
  end

  def show_stars
    puts 'Dealer card'
    @game.dealer.hand.each { print " * " }
    puts ''
  end

  def new_game
    main_menu
    loop do
      case gets.to_i
      when 1
        start
      when 2
        exit
      end
    end
  end

  def start
    clear_terminal
    @game.set_computer
    @game.set_user(get_name)
    clear_terminal
    begin_game
  end

  def begin_game
    @game.deck.shuffle
    @game.deals_card
    @game.make_bet
    show_hand(@game.player)
    show_stars
    loop do
      game_menu
      case gets.to_i
      when 1
        clear_terminal
        @game.player.player_take_card(@game.deck, 1)
        show_hand(@game.player)
        @game.make_move_comp
        show_stars
      when 2
        clear_terminal
        @game.make_move_comp
        show_hand(@game.player)
        show_stars
      when
        finish_party
      end
    end
  end

  def finish_party
    clear_terminal
    show_hand(@game.player)
    show_hand(@game.dealer)
    puts ''
    puts "Winner is #{@game.winner.name ||= 'noboby' }"
    puts ''
    puts "#{@game.player.name} your coin - #{@game.player.coin} Dealers coin - #{@game.dealer.coin}"
    puts "Press any key ..."
    gets
    contined
  end

  def contined
    clear_terminal
    return_menu
    loop do
      case gets.to_i
      when 1
        clear_terminal
        @game.discharge
        begin_game
      when 2
        clear_terminal
        new_game
      when 3
        clear_terminal
        puts 'By ...'
        exit
      end
    end
  end
end
