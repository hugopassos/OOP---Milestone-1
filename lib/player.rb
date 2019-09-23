# frozen_string_literal: true

class Player
  attr_reader :name, :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
  end
end
