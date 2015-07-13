=begin
field = {
          "1" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "2" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "3" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "4" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "5" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "6" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "7" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "8" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "9" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
          "10" => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"]
        }
=end


$field = {0 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  1 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  2 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  3 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  4 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  5 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  6 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  7 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  8 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  9 => ["_", "_", "_", "_", "_", "_", "_", "_", "_", "_"],
  }



class Ship
  def initialize(size)
    @size = size
    @status = true
    @location = size
  end
  attr_reader :size, :location, :status
  

  def is_hit
    @location -= 1
    if @location == 0
      @status = false
    end
  end
  
end

def convert(x, y)
  return ((x-1)*11) + (y-1)
end

# Location modifies field (for now, location must take field as an argument, but it won't have to when field is an instance variable in a class)
def location(size)
  valid = false
  while !valid
    if rand(2) == 0 #Horizontal ship
      valid = true
      row = rand(10)
      start_col = rand(11 - size)
      for i in 0...size
        if $field[row][start_col + i] != "_"
          valid = false
        end
      end
      if valid
        for i in 0...size
          $field[row][start_col + i] = size.to_s
        end
      end
    else #Vertical ship
      valid = true
      col = rand(10)
      start_row = rand(11 - size)
      for i in 0...size
        if $field[start_row + i][col] != "_"
          valid = false
        end
      end
      if valid
        for i in 0...size
         $field[start_row + i][col] = size.to_s
        end
      end
    end
  end
end

scout = Ship.new(2)
destroyer = Ship.new(3)
battleship = Ship.new(4)
carrier = Ship.new(5)
location(scout.size)
location(destroyer.size)
location(battleship.size)
location(carrier.size)

# Prints field in an easy-to-read way

for i in 0...$field.length
  row = ""
  for j in 0...$field[i].length
    row += $field[i][j]
  end
  puts row
end


#Prep

puts "Welcome to Battlefield"
puts "first you have to guess a spot on the board and if you hit a ship an x will appear in its place on the board"
puts "example: 1,1"
puts "x_________
__________
__________
__________
__________
__________
__________
__________
__________
__________"
sleep 3
puts "There are 4 different ships of various lengths, including: 2,3,4 and 5"
puts " You must hit each point on the ship" 
sleep 3
puts "We are currently creating your board"
sleep 1
puts "."
sleep 1
puts ".."
sleep 1
puts "..."
sleep 1
puts "Your board is ready:"
board = "__________
__________
__________
__________
__________
__________
__________
__________
__________
__________"

puts board #playing board
sleep 3

#RUN
 

# user_one = Ship.new
puts "let's get started"

#field.count("X")
puts "Choose your points"
until  scout.status == false && destroyer.status == false && battleship.status == false && carrier.status == false do
  puts "row?"
  row = gets.chomp.to_i
  puts "column?"
  column = gets.chomp.to_i
  if $field[row - 1][column - 1] == "_"
    board[convert(row, column)] = "o"
    puts board
  else
    board[convert(row, column)] = "x"
    puts board
    if $field[row - 1][column - 1] == "2" 
      scout.is_hit
    elsif $field[row - 1][column - 1] == "3"
      destroyer.is_hit
    elsif $field[row - 1][column - 1] == "4"
      battleship.is_hit
    elsif $field[row - 1][column - 1] == "5"
      carrier.is_hit
    end
  end
end

puts "YOU WON!!!"