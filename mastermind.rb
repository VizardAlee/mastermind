# frozen_string_literal: true

require 'colorize'
# mastermind is a game that makes a player generate random  color, and then give the other player a chance
# of up to 12 moves not, not only guess the colors, but their sequence of occurence

# colors I know
colors = ['cyan', 'red', 'green', 'blue', 'white', 'yellow']
board = ['', '', '', '']

# board layout
def board_layout(board)
  puts " --#{board[0]}-- | --#{board[1]}-- | --#{board[2]}-- | --#{board[3]}-- "
end

# board_layout(board)

# randomizing the color
def random_color(colors)
  colors.sample
end

# multiple random  colors
def multi_rand_colors(colors)
  new_set = []

  while new_set.length < 4
    new_set.push(colors.sample)
  end
  new_set
end

def regular_index_move(move)
  move.to_i - 1
end

# method for extracting index number
def get_indexes(index_move)
  string = index_move.to_s.split('')
  integer = string.map { |number| number.to_i }
  return integer
end

# match indexes to color
def index_to_color(index_move)
  the_vals = index_move.map do |value|
    if value == 1
      value = 'cyan'
    elsif value == 2
      value = 'red'
    elsif value == 3
      value = 'green'
    elsif value == 4
      value = 'blue'
    elsif value == 5
      value = 'white'
    elsif value == 6
      value = 'yellow'
    end
  end
  the_vals
end
# index_to_color([6,5,4,3])

def match(colors, index_to_color, board)
  colors.each_with_index do |color, index|
    index_to_color.each_with_index do |color2, index2|
      if color == color2 && index == index2
        board[index] = color
      end
    end
  end
  board_layout(board)
end

# match(colors, %w[cyan red green blue], board)

def arrayfy(strings)
  strings.join
end

def end_game_naration(board, random_colors)
  if board.none?('')
    puts 'congratulations!!'
  else
    puts 'Out of moves! Try again later!'
  end
  p random_colors
end

# mini game
def decoder_game(colors, board)
  puts "Welcome to mastermind game! the rules are simple. 1 = cyan, 2 = red, 3 = green, 4 = blue, 5 = white, 6 = yellow
  Choose the right combination!"
  random_colors = multi_rand_colors(colors)
  count = 6
  until board.none?('') || count.zero?
    move = gets.chomp
    index_move = get_indexes(move)
    match(random_colors, index_to_color(index_move), board)
    count -= 1
    p "You have #{count} moves left!"
  end
  end_game_naration(board, random_colors)
end

# decoder_game(colors, board)

def setter_game(colors, board)
  puts 'Welcome to mastermind game! Set the colors let computer decode them in 6 moves'
  # random_colors = multi_rand_colors(colors)
  count = 6
  set_colors = gets.chomp
  index_move = get_indexes(set_colors)
  move = index_to_color(index_move)
  until board.none?('') || count.zero?
    random_colors = multi_rand_colors(colors)
    match(move, random_colors, board)
    count -= 1
    p "#{count} moves left!"
  end
  end_game_naration(board, move)
end

setter_game(colors, board)
