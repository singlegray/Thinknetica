# frozen_string_literal: true

require_relative 'cargo_vagon'
require_relative 'passenger_vagon'

# trains
class Train
  attr_reader :number, :type, :route
  attr_accessor :speed, :vagon, :current_station

  def initialize(number, type)
    @speed  = 0
    @number = number
    @type   = type
    @vagon  = []
  end

  def stop
    self.speed = 0
  end

  def pricep
    p self
    if @type == ':pass'
      @vagon << PassengerVagon.new if @speed.zero?
    elsif @type == ':cargo'
      @vagon << CargoVagon.new if @speed.zero?
    end
  end

  def otcep
    @vagon.pop if @vagon.size.positive? && @speed.zero?
  end

  # Установка маршрута, поезд прибывает на первую станцию маршрута
  def set_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.arrive(self)
  end

  def get_next_station
    @current_station.departure(self)
    @current_station = @route.stations[get_index + 1]
    @current_station.arrive(self)
  end

  def get_prev_station
    @current_station.departure(self)
    @current_station = @route.stations[get_index - 1]
    @current_station.arrive(self)
  end

  def get_index
    index = @route.stations.index(@current_station)
  end
end
