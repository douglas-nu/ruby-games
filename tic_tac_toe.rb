player = -1
finish_game = false
board = [[0, 0, 0], [0, 0, 0], [0, 0, 0]]

def get_symbol(player)
  symbol = {-1 => "X", 1 => "O", 0 => " "}
  symbol[player]
end

def show_board(board)
  board.each_with_index do |line, index|

    line = " #{get_symbol(line[0])} | #{get_symbol(line[1])} | #{get_symbol(line[2])} "
    
    puts line
    puts "-" * line.length if index <= 1
  end
end


puts "Starting a new game"
puts
show_board board
puts

def check_win(board)
  limit = 2
  winner = false

  diagonal_1 = board[0][0] + board[1][1] + board[2][2]
  diagonal_2 = board[0][2] + board[1][1] + board[2][0]

  (0..2).each do |i|
    line = board[i][limit-2] + board[i][limit-1] + board [i][limit-0]
    column = board[limit-2][i] + board[limit-1][i] + board[limit-0][i]

    winner = line.abs == 3 || column.abs == 3 || diagonal_1.abs == 3 || diagonal_2.abs == 3
    break if winner
  end
  winner
end

(1..9).each do |i|
  puts "It's time player : #{get_symbol(player)}"

  row = nil
  column = nil

  loop do
    puts "Choose a row: "
    row = gets.strip
    puts "Choose a column: "
    column = gets.strip

    break if board[row.to_i][column.to_i] == 0

    puts "Please select a empty row and column!"
  end

  puts "---------------------------------"

  board[row.to_i][column.to_i] = player

  show_board board

  if (check_win board)
    puts "Player #{get_symbol(player)} is winner!!!"
    finish_game = true
  elsif(i == 9)
    puts "Broken game! Try again"
    finish_game = true
  else
    player = player == -1 ? 1 : -1 
  end

  break if finish_game
end

