# frozen_string_literal: true
class Board
  attr_accessor :square_values

  def initialize
    @square_values = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def draw_board
    puts '  ¹     | ²     | ³     '
    puts '        |       |       '
    puts "    #{@square_values[0]}   |   #{@square_values[1]}   |   #{@square_values[2]}   "
    puts '        |       |       '
    puts '        |       |       '
    puts ' -----------------------'
    puts '  ⁴     | ⁵     | ⁶     '
    puts '        |       |       '
    puts "    #{@square_values[3]}   |   #{@square_values[4]}   |   #{@square_values[5]}   "
    puts '        |       |       '
    puts '        |       |       '
    puts ' -----------------------'
    puts '  ⁷     | ⁸     | ⁹     '
    puts '        |       |       '
    puts "    #{@square_values[6]}   |   #{@square_values[7]}   |   #{@square_values[8]}   "
    puts '        |       |       '
    puts '        |       |       '
  end

  def square_play(choice, active_weapon)
    if choice.negative? || choice > 8
      return false, 'Invalid square. Values must be between 1 and 9.'
    elsif @square_values[choice] == ' '
      @square_values[choice] = active_weapon
      return true, ''
    else
      return false, 'Invalid square. Choose an empty square.'
    end
  end
end
