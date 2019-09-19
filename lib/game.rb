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
    @board.square_values.each_with_index do |value, index|
      next if index % 3 != 0
      if @board.square_values[index] != ' '
        game_over = true if @board.square_values[index] == @board.square_values[index + 1] && @board.square_values[index] == @board.square_values[index + 2]
      end
    end

    # check columns
    game_over = true if @board.square_values[0] == @board.square_values[3] && @board.square_values[0] == @board.square_values[6] && @board.square_values[0] != ' '
    game_over = true if @board.square_values[1] == @board.square_values[4] && @board.square_values[1] == @board.square_values[7] && @board.square_values[1] != ' '
    game_over = true if @board.square_values[2] == @board.square_values[5] && @board.square_values[2] == @board.square_values[8] && @board.square_values[2] != ' '

    # check diagonals
    game_over = true if @board.square_values[0] == @board.square_values[4] && @board.square_values[0] == @board.square_values[8] && @board.square_values[0] != ' '
    game_over = true if @board.square_values[2] == @board.square_values[4] && @board.square_values[2] == @board.square_values[6] && @board.square_values[2] != ' '
    game_over
  end
end
