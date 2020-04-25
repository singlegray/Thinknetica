# frozen_string_literal: true
require_relative 'instance_counter'

class Station
  include InstanceCounter

  attr_reader :trains, :name
  @@count = 0

  def self.all
    @@count
  end

  def initialize(name)
    @name   = name
    @trains = []
    @@count += 1
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
end
