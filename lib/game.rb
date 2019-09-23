# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

class Game
  def initialize(player_one, player_two, board)
    @player_one = player_one
    @player_two = player_two
    @board = board
  end

  def switch_player(active_player)
    active_player == @player_one ? @player_two : @player_one
  end

  def check_rows
    @board.sq_val.each_with_index do |_value, i|
      next if i % 3 != 0

      if @board.sq_val[i] != ' '
        return true if @board.sq_val[i] == @board.sq_val[i + 1] && @board.sq_val[i] == @board.sq_val[i + 2]
      end
    end
    false
  end

  def check_columns
    @board.sq_val.each_with_index do |_value, i|
      next if i > 2

      if @board.sq_val[i] != ' '
        return true if @board.sq_val[i] == @board.sq_val[i + 3] && @board.sq_val[i] == @board.sq_val[i + 6]
      end
    end
    false
  end

  def check_diagonal_one
    if @board.sq_val[0] != ' '
      return true if @board.sq_val[0] == @board.sq_val[4] && @board.sq_val[0] == @board.sq_val[8]
    end
    false
  end

  def check_diagonal_two
    if @board.sq_val[2] != ' '
      return true if @board.sq_val[2] == @board.sq_val[4] && @board.sq_val[2] == @board.sq_val[6]
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
