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
    if active_player == @player_one
      active_player = @player_two
    elsif active_player == @player_two
      active_player = @player_one
    end
    active_player
  end

  def determine_winner(board, game_over)
    # check rows
    @board.sq_val.each_with_index do |value, index|
      next if index % 3 != 0
      if @board.sq_val[index] != ' '
        game_over = true if @board.sq_val[index] == @board.sq_val[index + 1] && @board.sq_val[index] == @board.sq_val[index + 2]
      end
    end

    # check columns
    @board.sq_val.each_with_index do |value, index|
      next if index > 2
      if @board.sq_val[index] != ' '
        game_over = true if @board.sq_val[index] == @board.sq_val[index + 3] && @board.sq_val[index] == @board.sq_val[index + 6]
      end
    end

    # check diagonals
    @board.sq_val.each_with_index do |value, index|
      if @board.sq_val[0] != ' '
        game_over = true if @board.sq_val[0] == @board.sq_val[4] && @board.sq_val[0] == @board.sq_val[8]
      end
      if @board.sq_val[2] != ' '
        game_over = true if @board.sq_val[2] == @board.sq_val[4] && @board.sq_val[2] == @board.sq_val[6]
      end
    end
    game_over
  end
end
