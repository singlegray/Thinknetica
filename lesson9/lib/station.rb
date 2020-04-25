# frozen_string_literal: true

require_relative 'instance_counter'
require_relative 'validation'

class Station
  include InstanceCounter
  include Validation

  attr_reader :trains, :name
  @count = 0
  STATION_NAME = /^[a-z]{3,}$/i.freeze

  def self.all
    @@count
  end

  def initialize(name)
    @name   = name
    @trains = []
    @count += 1
    validate!
    register_instance
  end

  def trains_block
    @trains_list.each { |train| yield(train) }
  end

  def arrive(train)
    @trains.push(train)
  end

  def list_train(type = nil)
    @trains.select { |train| train.type == type }
  end

  def departure(train)
    @trains.delete(train)
  end

  def validate!
    validate_name_empty!
    validate_station_name!
  end

  def validate_name_empty!
    raise ArgumentError, "Name can't be empty" if @name.empty?
  end

  def validate_station_name!
    if @name !~ STATION_NAME
      raise ArgumentError, "Name '#{@name}' has no valid format"
    end
  end
end
