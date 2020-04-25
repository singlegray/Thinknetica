# frozen_string_literal: true

class Station
  attr_reader :trains
  attr_accessor :name

  def initialize(name)
    @name = name
    @trains = []
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
