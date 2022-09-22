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

# mini game
def mini_game(colors)
  random_colors = multi_rand_colors(colors)
  move = gets.chomp
  if random_colors.any?(move)
    puts "#{move} is in the mix!"
    random_colors.each_with_index do |color, index|
      if color == move
        puts "The color is at index #{index}"
        return
      end
    end
  else
    puts "#{move} is not in the mix"
    random_colors
  end
end

mini_game(colors)