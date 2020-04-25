# frozen_string_literal: true

module Valide
  def valid?
    validate!
    true
  rescue StandardError
    false
  end
end
