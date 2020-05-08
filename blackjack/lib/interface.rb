class Interface
  def initialize

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
    player.hand.each { |i| print "#{i} " }
  end

  def get_name
    puts "Enter your name"
    name = gets.chomp
    return name
  end
end