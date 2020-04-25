# frozen_string_literal: true

# routes
class Route
  attr_reader :stations

  def initialize(start_station, end_station)
    @stations = [start_station, end_station]
  end

  def add_station(station)
    @stations.insert(-1, station)
  end

  def delete_station(station)
    @stations.delete(station) if staion != @stations[0] && station != @stations[-1]
  end

  def list_station
    @stations.each { |station| puts station.name }
  end
end
