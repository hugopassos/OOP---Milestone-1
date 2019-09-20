# frozen_string_literal: true

class Board
  attr_accessor :sq_val

  def initialize
    @sq_val = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def square_play(choice, active_weapon)
    if choice.negative? || choice > 8
      validation = [false, 'Invalid square. Values must be between 1 and 9.']
    elsif @sq_val[choice] == ' '
      @sq_val[choice] = active_weapon
      validation = [true, '']
    else
      validation = [false, 'Invalid square. Choose an empty square.']
    end
    validation
  end
end
