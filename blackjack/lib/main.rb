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
    clear_terminal
    # определить компьютер
    @dealer = Computer.new()
    # определить пользователя человека
    puts 'Enter your name'
    name = gets.chomp
    clear_terminal
    @player = Human.new(name)
    @players.push(@dealer)
    @players.push(@player)
    start
  end

  def start
    @deck.shuffle
    deals_card
    show_hand(@player)

    loop do
      @interface.menu
      case gets.to_i
      when 1
        clear_terminal
        player_take_card(@player, 1)
        show_hand(@player)
      when 2
        clear_terminal
        open_card
      when 3
        puts 'By'
        break
      end
    end
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

  # посчитать очки
  def count_score
    # @players.each do |player|
    #   player.
    #end
  end

  # показать руку игрока
  def show_hand(player)
    puts "#{player.name} your card"
    player.hand.each { |i| print "#{i[0]} " }
  end

  #сделать ставку
  def make_bet(player)
    player.coin -= 100
  end

  def clear_terminal
    system('cls')
  end
end

