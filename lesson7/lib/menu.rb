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
  def show_text_station
    puts '1 - Create station'
    puts '2 - List station'
    puts '3 - List train on station'
    puts '4 - Main menu'
  end

  def show_station_menu
    clear_terminal
    show_text_station
    loop do
      case gets.to_i
      when 1
        create_station
        puts"Station #{@stations[-1].name} is created enter any key"
        gets
        show_station_menu
      when 2
        list_station
        puts"Enter any key"
        gets
        show_station_menu
      when 3
        show_list_train_on_station
      when 4
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

  def list_array_station
    @stations.each_with_index { |station, i| puts "#{i + 1} - #{station.name}"}
  end

  def show_list_train_on_station
    puts 'Select station for control or 0 for exit'
    list_array_station
    loop do
      index = gets.to_i
      case index
      when 0
        show_station_menu
      else
        station = @stations[index - 1]
        p station
        station.list_train
        gets 'Press any key ...'
        show_train_menu
      end
    end
  end
  # -- station

  def show_text_train
    puts '1 - Create train'
    puts '2 - List train'
    puts '3 - Control train'
    puts '4 - Main menu'
  end

  # -- train
  def show_train_menu
    show_text_train
    loop do
      case gets.to_i
      when 1
        create_train
      when 2
        list_train
      when 3
        control_train
      when 4
        show_main_menu
      else
        show_train_menu
      end
    end
  end

  def create_train
    puts 'Enter train number'
    number = gets.chomp
    puts 'Enter type train 1-pass 2-cargo'
    train_types = gets.chomp
    if train_types == '1'
      @trains << PassengerTrain.new(number)
    elsif train_types == '2'
      @trains << CargoTrain.new(number)
    else
      puts 'Error'
    end
    show_train_menu
  end

  def list_train
    @trains.each { |train| puts train.number }
    puts 'Press any key'
    gets
    show_train_menu
  end

  def control_train
    puts 'Select train for control or 0 for exit'
    @trains.each_with_index { |train, i| puts "#{i + 1} - #{train.number}"}
    loop do
      index = gets.to_i
      case index
      when 0
        show_train_menu
      else
        train = @trains[index - 1]
        show_vagon_menu(train)
      end
    end
  end

  def show_text_vagon
    puts '1 - add vagon'
    puts '2 - delete vagon'
    puts '3 - show train menu'
  end

  def show_vagon_menu (train)
    clear_terminal
    show_text_vagon
    # p train
    loop do
      case gets.to_i
      when 1
        train.pricep
        puts "Vagon added. Count #{train.vagon.size} Press any key"
        gets
        show_vagon_menu(train)
      when 2
        train.otcep
        puts "Vagon deleted. Count #{train.vagon.size} Press any key"
        gets
        show_vagon_menu(train)
      when 3
        show_train_menu
      else
        show_vagon_menu(train)
      end
    end
  end
  # -- train

  # -- route
  def show_text_route
    puts '1 - Create route'
    puts '2 - List route'
    puts '3 - Control route'
    puts '4 - Main menu'
  end

  def show_route_menu
    clear_terminal
    show_text_route
    loop do
      case gets.to_i
      when 1
        create_route
      when 2
        list_route
        puts 'Press any key ...'
        gets
        show_route_menu
      when 3
        control_route
      when 4
        show_main_menu
      else
        show_route_menu
      end
    end
  end

  def control_route
    puts 'Select route for contorl or 0 for exit'
    @routes.each { |route| puts "#{route.stations[0].name} - #{route.stations[-1].name}" }
    loop do
      index = gets.to_i
      case index
      when 0
      else
        route = @routes[index - 1]
        show_control_route_menu(route)
      end
    end
  end

  def show_text_control_route
    puts '1 - Add station'
    puts '2 - Delete station'
    puts '3 - Main menu'
  end

  def show_control_route_menu(route)
    show_text_control_route
    loop do
      case gets.to_i
      when 1
        @routes << get_station
      when 2
        @routes.pop
      when 3
        show_main_menu
      else
        show_control_route_menu
      end
    end
  end

  def get_station
    list_array_station
    index = gets.to_i
    station = @stations[index - 1]
  end

  def create_route
    puts 'Enter number begin station'
    beginstation = get_station
    puts 'Enter number end station'
    endstation = get_station
    @routes << Route.new(beginstation, endstation)
    puts 'Route is created. Press any key...'
    gets
    show_route_menu
  end

  def list_route
    @routes.each { |route| puts "#{route.stations[0].name} - #{route.stations[-1].name}" }
  end
  # -- route

  # -- main
  def show_text_main
    puts '1 - Manage station'
    puts '2 - Manage train'
    puts '3 - Manage route'
    puts '4 - Exit'
  end

  def show_main_menu
    show_text_main
    loop do
      case gets.to_i
      when 1
        show_station_menu
      when 2
        show_train_menu
      when 3
        show_route_menu
      when 4
        puts 'By'
        break
      end
    end
  end
  # -- main

  def clear_terminal
    system('cls')
  end
end
