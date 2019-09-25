require '../lib/player.rb'
require '../lib/board.rb'
require '../lib/game.rb'

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

print 'Player one name:'
name = gets.chomp
player_one = Player.new(name, 'X')

print 'Player two name:'
name = gets.chomp
player_two = Player.new(name, 'O')

game = Game.new(player_one, player_two)
puts game.board.sq_val[0]

count = 0
game_over = false

while game_over == false
  draw_board(game.board)

  puts "#{game.active_player.name}, choose a square value: "

  validation = game.valid?(gets.chomp.to_i - 1)

  while validation[0] == false
    draw_board(game.board)
    puts validation[1]
    puts "#{game.active_player.name}, choose a square value: "
    validation = game.valid?(gets.chomp.to_i - 1)
  end

  game_over = game.determine_winner

  # display message for the winner
  if game_over == true
    draw_board(game.board)
    puts "Congratulations #{game.active_player.name}, you won!"
    break
  end

  count += 1

  # logic for draw
  if count == 9
    game_over = true
    draw_board(game.board)
    puts 'Game draw.'
  end

  game.switch_player
end
