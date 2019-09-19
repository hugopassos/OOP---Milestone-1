# frozen_string_literal: true

class Board
  attr_accessor :sq_val

  def initialize
    @sq_val = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ']
  end

  def draw_board
    puts '  ¹     | ²     | ³     '
    puts '        |       |       '
    puts "    #{@sq_val[0]}   |   #{@sq_val[1]}   |   #{@sq_val[2]}   "
    puts '        |       |       '
    puts '        |       |       '
    puts ' -----------------------'
    puts '  ⁴     | ⁵     | ⁶     '
    puts '        |       |       '
    puts "    #{@sq_val[3]}   |   #{@sq_val[4]}   |   #{@sq_val[5]}   "
    puts '        |       |       '
    puts '        |       |       '
    puts ' -----------------------'
    puts '  ⁷     | ⁸     | ⁹     '
    puts '        |       |       '
    puts "    #{@sq_val[6]}   |   #{@sq_val[7]}   |   #{@sq_val[8]}   "
    puts '        |       |       '
    puts '        |       |       '
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
