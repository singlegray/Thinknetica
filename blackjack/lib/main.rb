# frozen_string_literal: true

class Main
  require_relative 'deck'
  require_relative 'player'
  require_relative 'interface'
  require_relative 'computer'
  require_relative 'human'

  def initialize
    @deck = Deck.new
    @interface = Interface.new
    @players = []
  end

  def newgame
    # set_computer
    set_user
    clear_terminal
    start
  end

  def start
    @deck.shuffle
    deals_card
    show_hand(@player)
    make_bet()
    loop do
      @interface.menu
      case gets.to_i
      when 1
        clear_terminal
        player_take_card(@player, 1)
        show_hand(@player)
        make_move_comp
      when 2
        clear_terminal
        open_card
      when 3
        make_move_comp
      end
    end
  end

  def set_computer
    @dealer = Computer.new("Comp")
    @players.push(@dealer)
  end

  def set_user
    puts "Enter your name"
    name = gets.chomp
    @player = Human.new(name)
    @players.push(@player)
  end
  # раздать карты
  def deals_card
    @players.each { |player| player_take_card(player, 2) }
  end

  # игрок берет карту на руку
  def player_take_card(player, count = 1)
    count.times do
      card = @deck.deck.pop
      player.hand.push(card)
      player.score += card[1]
    end
  end

  # вскрытие карт подсчет очков
  def open_card
    @players.each { |player| puts player.score }
  end

  # показать руку игрока
  def show_hand(player)
    puts "#{player.name} your card"
    player.hand.each { |i| print "#{i[0]} " }
  end

  #сделать ставку
  def make_bet()
    @players.each { |player| player.score - 10 }
  end

  def make_move_comp
    player_take_card(@players[0],1) if @players[0].score > 17
  end

  def clear_terminal
    system('cls')
  end
end
