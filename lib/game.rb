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

  def determine_winner(game_over)
    @board.sq_val.each_with_index do |_value, i|
      next if i % 3 != 0

      if @board.sq_val[i] != ' '
        game_over = true if @board.sq_val[i] == @board.sq_val[i + 1] && @board.sq_val[i] == @board.sq_val[i + 2]
      end
    end

    @board.sq_val.each_with_index do |_value, i|
      next if i > 2

      if @board.sq_val[i] != ' '
        game_over = true if @board.sq_val[i] == @board.sq_val[i + 3] && @board.sq_val[i] == @board.sq_val[i + 6]
      end
    end

    if @board.sq_val[0] != ' '
      game_over = true if @board.sq_val[0] == @board.sq_val[4] && @board.sq_val[0] == @board.sq_val[8]
    end
    if @board.sq_val[2] != ' '
      game_over = true if @board.sq_val[2] == @board.sq_val[4] && @board.sq_val[2] == @board.sq_val[6]
    end
    game_over
  end
end
