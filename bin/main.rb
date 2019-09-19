require '../lib/player.rb'
require '../lib/board.rb'
require '../lib/game.rb'

print 'Player one name: '
name = gets.chomp
player_one = Player.new(name, 'X')

print 'Player two name: '
name = gets.chomp
player_two = Player.new(name, 'O')

board = Board.new

game = Game.new(player_one, player_two, board)

active_player = player_one
count = 0
game_over = false

while game_over == false
  board.draw_board

  puts "#{active_player.name}, choose a square value: "
  validation = board.square_play(gets.chomp.to_i - 1, active_player.weapon)

  while validation[0] == false
    puts validation[1]
    validation = board.square_play(gets.chomp.to_i - 1, active_player.weapon)
  end

  game_over = game.determine_winner(board, game_over)
  # display message for the winner
  if game_over == true
    board.draw_board
    puts "Congratulations #{active_player.name}, you won!"
    break
  end

  count += 1

  # logic for draw
  if count == 9
    game_over = true
    board.draw_board
    puts 'Game draw.'
  end

  active_player = game.switch_player(active_player)
end
