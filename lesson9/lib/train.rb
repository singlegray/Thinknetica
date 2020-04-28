# frozen_string_literal: true

require_relative 'company'
require_relative 'instance_counter'
require_relative 'validation'

# trains
class Train
  include Company
  include InstanceCounter
  include Validation

  attr_reader :number, :type, :route
  attr_accessor :speed, :vagon, :current_station

  NUMBER_FORMAT = /^[\w\d]{3}-?[\w\d]{2}$/i.freeze

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT

  @trains = {}

  def self.find(number)
    @trains[number]
  end

  def initialize(number, type)
    @number          = number
    @type            = type
    validate!
    @speed           = 0
    @vagon           = []
    @trains[number] = self
  end

  def stop
    stop!
  end

  def pricep
    if @type == ':pass'
      @vagon << PassengerVagon.new if @speed.zero?
    elsif @type == ':cargo'
      @vagon << CargoVagon.new if @speed.zero?
    end
  end

  def otcep
    @vagon.pop if @vagon.size.positive? && @speed.zero?
  end

  def seting_route(route)
    @route = route
    @current_station = route.stations[0]
    @current_station.arrive(self)
  end

  def next_station
    @current_station.departure(self)
    @current_station = @route.stations[index + 1]
    @current_station.arrive(self)
  end

  def prev_station
    @current_station.departure(self)
    @current_station = @route.stations[index - 1]
    @current_station.arrive(self)
  end

  def index
    @route.stations.index(@current_station)
  end

  def wagons_block
    @wagons.each { |wagon| yield(wagon) }
  end

  protected

  def stop!
    self.speed = 0
  end
end