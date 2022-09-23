# frozen_string_literal: true

require 'colorize'
# mastermind is a game that makes a player generate random  color, and then give the other player a chance
# of up to 12 moves not, not only guess the colors, but their sequence of occurence

# colors I know
colors = ['cyan', 'red', 'green', 'blue', 'white', 'yellow']

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
=begin
  some = index_move.map do |value|
    see = colors.each_with_index do |color, index|
      if value == index
        p color
      end
    end
    see
  end
  p some
=end
end
# index_to_color([6,5,4,3])

def arrayfy(strings)
  strings.join
end

# arrayfy('strings and stuff')

# index_to_color(colors, [0,1,2,5])
# mini game
def mini_game(colors)
  puts "Welcome to mastermind game! the rules are simple.0 = cyan, 1 = red, 2 = green, 3 = blue, 4 = white, 5 = yellow
  Choose the right combination!"
  random_colors = multi_rand_colors(colors)
  move = gets.chomp
  index_move = get_indexes(move)
  index_to_color(index_move)
=begin
  if random_colors.any?(index_move)
    puts "#{index_move} is in the mix!"
    random_colors.each_with_index do |color, index|
      if color == index_move
        puts "The color is at index #{index}"
        break
      end
    end
  else
    puts "#{index_move} is not in the mix"
    p random_colors
  end
=end
end

p mini_game(colors)