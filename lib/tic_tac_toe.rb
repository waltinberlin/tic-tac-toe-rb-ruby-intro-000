# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    if (board[win_index_1]=="X" && board[win_index_2]=="X" && board[win_index_3]=="X") || (board[win_index_1]=="O" && board[win_index_2]=="O" && board[win_index_3]=="O")
      return win_index_1, win_index_2, win_index_3
    end
  end
end

def full?(board)
  board.none? {|position| position==" "}
end

def draw?(board)
  if full?(board) == true && won?(board) == false
    true
  else
    false
  end
end

def over?(board)
  if (draw?(board)==true)
    true
  elsif won?(board) != false && full?(board) == true
    true
  elsif won?(board) != false && full?(board) == false
    true
  else
    false
  end
end

def winner(board)
  ret = won?(board)
  if ret != false
    board[ret[0]]
  else
    nil
  end
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(user_input)
 position = user_input.to_i
 position - 1
end

def move(board, position, char)
  board[position] = char
end

def valid_move?(board, index)
  if index>=0 && index<=8
    if position_taken?(board, index) == true
      false
    else
      true
    end
  else
    false
  end
end

def turn(board)
  puts "Please enter 1-9:"
  user_input = gets
  index=input_to_index(user_input)
  while valid_move?(board,index) == false
    user_input = gets
    index=input_to_index(user_input)
  end
  move(board,index,"X")
  display_board(board)
end

def turn_count(board)
  count = 0
  board.each do |position|
    if position == "X" || position == "O"
      count+=1
    end
  end
  count
end

def current_player(board)
  countX = 0
  countO = 0
  board.each do |position|
    if position == "X"
      countX+=1
    elsif position == "O"
      countO+=1
    end
  end
  if countX > countO
    "O"
  else
    "X"
  end
end

def play(board)

end
