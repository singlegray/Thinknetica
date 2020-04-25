# frozen_string_literal: true

# stations
class Station
  attr_reader :train
  attr_accessor :name

  def initialize(name)
    @name = name
    @train = []
  end

  def arrive(train)
    @train.push(train)
  end

  def list_train(type = '')
    if type == ''
      puts train
    else
      @train.each { |train| puts train.number if train.type == type }
    end
  end

  def departure(train)
    @train.delete(train)
  end
end

# routes
class Route
  attr_reader :route

  def initialize(start_station, end_station)
    @route = []
    @route.push(start_station)
    @route.push(end_station)
  end

  def add_station(station)
    @route.insert(1, station)
  end

  def delete_station(station)
    @route.delete(station)
  end

  def list_station
    @route.each { |station| puts station.name }
  end
end

# trains
class Train
  attr_reader :number, :type, :route, :current_station
  attr_accessor :speed, :vagon

  def initialize(number, type, vagon)
    @speed  = 0
    @number = number
    @type   = type
    @vagon  = vagon
    @route  = []
    @current_station = ''
  end

  def stop
    self.speed = 0
  end

  def pricep
    @vagon += 1 if @speed == 0
  end

  def otcep
    @vagon -= 1 if @vagon > 0 && @speed == 0
  end

  def set_route(route)
    @route = route
    station = route.route[0]
    station.arrive(self)
    @cur_station_index = 0
  end

  def back_movie
    station = @route.route[@cur_station_index - 1]
    station.arrive(self)
  end

  def forward_movie
    station = @route.route[@cur_station_index + 1]
    station.arrive(self)
  end
end

# stations objects
romashkovo = Station.new('Romashkovo')
silent     = Station.new('Silent')
sea        = Station.new('Sea')
sunny      = Station.new('Sunny')
moon       = Station.new('Moon')

# trains objects
sapsan    = Train.new('749', '1', 5)
lastochka = Train.new('364', '1', 7)
gruz      = Train.new('4222', '2', 15)

# test station
romashkovo.arrive(sapsan)
romashkovo.arrive(gruz)
# romashkovo.list_train
romashkovo.departure(gruz)
# romashkovo.list_train(1)

# test route
route1 = Route.new(romashkovo, sunny)
# route1.list_station

# test train
sapsan.speed = 100
sapsan.speed = 0
# puts sapsan.speed
sapsan.pricep
# puts sapsan.vagon
sapsan.otcep
# puts sapsan.vagon

sapsan.set_route(route1)
sapsan.forward_movie
