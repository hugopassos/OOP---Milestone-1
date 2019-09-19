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
    active_player = active_player == @player_one ? @player_two : @player_one
  end

  def check_rows(game_over)
    @board.sq_val.each_with_index do |_value, i|
      next if i % 3 != 0

      if @board.sq_val[i] != ' '
        game_over = true if @board.sq_val[i] == @board.sq_val[i + 1] && @board.sq_val[i] == @board.sq_val[i + 2]
      end
    end
    game_over
  end

  def check_columns(game_over)
    @board.sq_val.each_with_index do |_value, i|
      next if i > 2

      if @board.sq_val[i] != ' '
        game_over = true if @board.sq_val[i] == @board.sq_val[i + 3] && @board.sq_val[i] == @board.sq_val[i + 6]
      end
    end
    game_over
  end

  def check_diagonal_one(game_over)
    if @board.sq_val[0] != ' '
      game_over = true if @board.sq_val[0] == @board.sq_val[4] && @board.sq_val[0] == @board.sq_val[8]
    end
    game_over
  end

  def check_diagonal_two(game_over)
    if @board.sq_val[2] != ' '
      game_over = true if @board.sq_val[2] == @board.sq_val[4] && @board.sq_val[2] == @board.sq_val[6]
    end
    game_over
  end

  def determine_winner(game_over)
    return true if check_rows(game_over) == true
    return true if check_columns(game_over) == true
    return true if check_diagonal_one(game_over) == true
    return true if check_diagonal_two(game_over) == true

    game_over
  end
end
