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
  puts "0    #{square_values[0][0]}   |   #{square_values[0][1]}   |   #{square_values[0][2]}   "
  puts "         |       |       "
  puts "  -----------------------"
  puts "         |       |       "
  puts "1    #{square_values[1][0]}   |   #{square_values[1][1]}   |   #{square_values[1][2]}   "
  puts "         |       |       "
  puts "  -----------------------"
  puts "         |       |       "
  puts "2    #{square_values[2][0]}   |   #{square_values[2][1]}   |   #{square_values[2][2]}   "
  puts "         |       |       "
end

def get_names
  puts "Player one name:"
  name = gets.chomp
  weapon = "X"
  $player_one = Player.new(name, weapon)

  puts "Player two name:"
  name = gets.chomp
  weapon = "O"
  $player_two = Player.new(name, weapon)
end

def switch_player
  if $active_player == $player_one.name
    $active_player = $player_two.name
    $active_weapon = $player_two.weapon
  elsif active_player == $player_two.name
    $active_player = $player_one.name
    $active_weapon = $player_one.weapon
  end
end

get_names

square_values = [[" ", " ", " "], [" ", " ", " "], [" ", " ", " "]]

$active_player = $player_one.name
$active_weapon = $player_one.weapon

puts $active_player
puts $active_weapon

draw_board(square_values)
puts "#{$active_player}, choose a square: "
choice = gets.chomp

while square_values[choice[0].to_i][choice[1].to_i] != " "
  puts "Invalid square. Choose an empty square."
  choice = gets.chomp
end

square_values[choice[0].to_i][choice[1].to_i] = $active_weapon

switch_player

draw_board(square_values)
puts "#{$active_player}, choose a square: "
choice = gets.chomp

while square_values[choice[0].to_i][choice[1].to_i] != " "
  puts "Invalid square. Choose an empty square."
  choice = gets.chomp
end
