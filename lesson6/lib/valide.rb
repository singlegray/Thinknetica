module Valide
  def valid?
    validate!
    true
  rescue
    false
  end
end
