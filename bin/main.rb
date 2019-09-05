class Player
  attr_accessor :name, :weapon

  def initialize(name, weapon)
    @name = name
    @weapon = weapon
  end
end

def draw_board(square_values)
  puts "     0       1       2   "
  puts "         |       |       "
  puts "0    #{square_values[0]}   |   #{square_values[1]}   |   #{square_values[2]}   "
  puts "         |       |       "
  puts "  -----------------------"
  puts "         |       |       "
  puts "1    #{square_values[3]}   |   #{square_values[4]}   |   #{square_values[5]}   "
  puts "         |       |       "
  puts "  -----------------------"
  puts "         |       |       "
  puts "2    #{square_values[6]}   |   #{square_values[7]}   |   #{square_values[8]}   "
  puts "         |       |       "
end

def get_name(num, weapon)
  puts "Player #{num} name:"
  name = gets.chomp
  player_one = Player.new(name, weapon)
end

def switch_player(active_player, player_one, player_two)
  if active_player == player_one.name
    active_player = player_two.name
    active_weapon = player_two.weapon
  elsif active_player == player_two.name
    active_player = player_one.name
    active_weapon = player_one.weapon
  end
  puts "Im inside the method #{active_player}"
  return active_player, active_weapon
end

def determine_winner(weapon, square_values, game_over)
  game_over = true if square_values[0] == square_values[1] && square_values[0] == square_values[2]
  game_over = true if square_values[3] == square_values[4] && square_values[3] == square_values[5]
  game_over = true if square_values[6] == square_values[7] && square_values[6] == square_values[8]

  game_over = true if square_values[0] == square_values[3] && square_values[0] == square_values[6]
  game_over = true if square_values[1] == square_values[4] && square_values[1] == square_values[7]
  game_over = true if square_values[2] == square_values[5] && square_values[2] == square_values[8]

  game_over = true if square_values[0] == square_values[4] && square_values[0] == square_values[8]
  game_over = true if square_values[2] == square_values[4] && square_values[2] == square_values[6]

  game_over
end


player_one = get_name("one", "X")
player_two = get_name("two", "O")

square_values = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

active_player = player_one.name
active_weapon = player_one.weapon

puts active_player
puts active_weapon

count = 0
game_over = false

while game_over == false
  draw_board(square_values)

  puts "#{active_player}, choose a square: "
  choice = gets.chomp.to_i
  choice -= 1

  while square_values[choice.to_i] != " "
    puts "Invalid square. Choose an empty square."
    choice = gets.chomp
  end

  square_values[choice.to_i] = active_weapon

  game_over = determine_winner(active_weapon, square_values, game_over)

  # logic for draw
  if count == 9
    game_over = true
    draw_board(square_values)
    puts "Game draw."
  end

  if game_over == false
    puts "Im outside the method #{active_player}"

    active_player, active_weapon = switch_player(active_player, player_one, player_two)

    puts "Im back outside the method #{active_player}"
  end

  count += 1
end
