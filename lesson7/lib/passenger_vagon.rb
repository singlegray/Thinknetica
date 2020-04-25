# frozen_string_literal: true

require_relative 'vagon'

class PassengerVagon < Vagon
attr_reader :count_place, :uses_place, :type, :free_place, :occ_place

def initialize(number, type = ':pass', count_place = 0)
  @number      = number
  @count_place = count_place
  @type        = type
  @free_place  = count_place
  @occ_place   = 0
end

def take_place
  @occ_place += 1 if free_place.positive?
  @free_place -= 1 if free_place.positive?
end
end
