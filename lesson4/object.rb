# frozen_string_literal: true

# test
require_relative 'train'
require_relative 'station'
require_relative 'route'

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

romashkovo.arrive(sapsan)
romashkovo.arrive(gruz)
# romashkovo.list_train

romashkovo.departure(gruz)
# romashkovo.list_train(1)

route1 = Route.new(romashkovo, sunny)
route1.add_station(moon)
# route1.list_station
#puts route1.stations[-1].name

sapsan.set_route(route1)
#puts sapsan.current_station
sapsan.get_next_station
puts sapsan.current_station.name
sapsan.get_prev_station
puts sapsan.current_station.name
