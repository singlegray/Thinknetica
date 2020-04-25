# frozen_string_literal: true

require_relative 'vagon'

class CargoVagon < Vagon
  attr_reader :count_volume, :uses_place, :type, :free_volume, :occ_volume

  def initialize(number, type = ':cargo', count_volume = 0)
    @number       = number
    @count_volume = count_volume
    @type         = type
    @free_volume  = count_volume
    @occ_volume   = 0
  end

  def take_place
    @occ_volume += 1 if free_volume.positive?
    @free_volume -= 1 if free_volume.positive?
  end
end
