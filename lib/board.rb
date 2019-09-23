# frozen_string_literal: true

class Board
  attr_reader :sq_val

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

  def check_rows
    @sq_val.each_with_index do |_value, i|
      next if i % 3 != 0

      if @sq_val[i] != ' '
        return true if @sq_val[i] == @sq_val[i + 1] && @sq_val[i] == @sq_val[i + 2]
      end
    end
    false
  end

  def check_columns
    @sq_val.each_with_index do |_value, i|
      next if i > 2

      if @sq_val[i] != ' '
        return true if @sq_val[i] == @sq_val[i + 3] && @sq_val[i] == @sq_val[i + 6]
      end
    end
    false
  end

  def check_diagonal_one
    if @sq_val[0] != ' '
      return true if @sq_val[0] == @sq_val[4] && @sq_val[0] == @sq_val[8]
    end
    false
  end

  def check_diagonal_two
    if @sq_val[2] != ' '
      return true if @sq_val[2] == @sq_val[4] && @sq_val[2] == @sq_val[6]
    end
    false
  end

  def determine_winner
    return true if check_rows == true
    return true if check_columns == true
    return true if check_diagonal_one == true
    return true if check_diagonal_two == true

    false
  end
end
