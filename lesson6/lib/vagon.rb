require_relative 'company'

class Vagon
  include Company

  def initialize(number, type)
    @number = number
    @type   = type
  end
end
