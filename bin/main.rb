require_relative 'player.rb'
require_relative 'board.rb'
require_relative 'game.rb'

def draw_board(board)
  puts '  ¹     | ²     | ³     '
  puts '        |       |       '
  puts "    #{board.sq_val[0]}   |   #{board.sq_val[1]}   |   #{board.sq_val[2]}   "
  puts '        |       |       '
  puts '        |       |       '
  puts ' -----------------------'
  puts '  ⁴     | ⁵     | ⁶     '
  puts '        |       |       '
  puts "    #{board.sq_val[3]}   |   #{board.sq_val[4]}   |   #{board.sq_val[5]}   "
  puts '        |       |       '
  puts '        |       |       '
  puts ' -----------------------'
  puts '  ⁷     | ⁸     | ⁹     '
  puts '        |       |       '
  puts "    #{board.sq_val[6]}   |   #{board.sq_val[7]}   |   #{board.sq_val[8]}   "
  puts '        |       |       '
  puts '        |       |       '
end

print 'Player one name: '
name = gets.chomp
player_one = Player.new(name, 'X')

print 'Player two name: '
name = gets.chomp
player_two = Player.new(name, 'O')

board = Board.new

puts board.sq_val[0]

game = Game.new(player_one, player_two, board)

active_player = player_one
count = 0
game_over = false

while game_over == false
  draw_board(board)

  puts "#{active_player.name}, choose a square value: "
  validation = board.square_play(gets.chomp.to_i - 1, active_player.weapon)

  while validation[0] == false
    puts validation[1]
    validation = board.square_play(gets.chomp.to_i - 1, active_player.weapon)
  end

  game_over = game.determine_winner(game_over)

  # display message for the winner
  if game_over == true
    draw_board(board)
    puts "Congratulations #{active_player.name}, you won!"
    break
  end

  count += 1

  # logic for draw
  if count == 9
    game_over = true
    draw_board(board)
    puts 'Game draw.'
  end

  active_player = game.switch_player(active_player)
end
