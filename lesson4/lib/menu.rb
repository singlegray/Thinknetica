# frozen_string_literal: true

require_relative 'train'
require_relative 'station'
require_relative 'route'
require_relative 'cargo_train'
require_relative 'cargo_vagon'
require_relative 'passenger_train'
require_relative 'passenger_vagon'

class Menu
  attr_accessor :stations, :trains, :routes

  def initialize
    @stations = []
    @trains   = []
    @routes   = []
  end

  # -- station
  def show_station_menu
    clear_terminal

    puts '1 - Create station'
    puts '2 - List station'
    puts '3 - List train on station'
    puts '4 - Main menu'

    loop do
      case gets.to_i
      when 1
        clear_terminal
        create_station
        puts"Station #{station} is created enter any key"
        gets
        show_station_menu
      when 2
        clear_terminal
        list_station
        puts"Enter any key"
        gets
        show_station_menu
      when 3
        clear_terminal
        # show_route_menu
      when 4
        clear_terminal
        show_main_menu
      end
    end
  end

  def create_station
    puts 'Enter name station'
    station = gets.chomp
    @stations << Station.new(station)
  end

  def list_station
    @stations.each { |station| puts station.name}
  end
  # -- station

  # -- train
  def show_train_menu
    puts '1 - Create train'
    puts '2 - List train'
    puts '3 - Main menu'
    loop do
      case gets.to_i
      when 1
        clear_terminal
        create_train
      when 2
        clear_terminal
        list_train
      when 3
        clear_terminal
        show_main_menu
      end
    end
  end

  def create_train
    puts 'Enter train number'
    puts 'Enter type train 1-pass 2-cargo '
    train = gets.chomp
    @trains << Train.new(train)
  end

  def list_train

  end
  # -- train


  def show_route_menu
    puts '1 - Create route'
    puts '2 - List route'
    puts '3 - Manage route'
  end

  # main
  def show_main_menu
    puts '1 - Manage station'
    puts '2 - Manage train'
    puts '3 - Manage route'
    puts '4 - Exit'

    loop do
      case gets.to_i
      when 1
        clear_terminal
        show_station_menu
      when 2
        clear_terminal
        show_train_menu
      when 3
        clear_terminal
        show_route_menu
      when 4
        clear_terminal
        puts 'By'
        break
      end
    end
  end

  def clear_terminal
    system('cls')
  end
end
