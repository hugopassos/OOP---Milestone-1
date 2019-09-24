# frozen_string_literal: true

require_relative 'board.rb'
require_relative 'player.rb'

class Game
  attr_reader :board, :active_player

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
    @active_player = @player_one
    @board = Board.new
  end

  def switch_player
    @active_player = @active_player == @player_one ? @player_two : @player_one
  end

  def determine_winner
    @board.check_rows || @board.check_columns || @board.check_diagonal_one || @board.check_diagonal_two
  end

  def valid?(choice)
    @board.square_play(choice, @active_player.weapon)
  end
end
