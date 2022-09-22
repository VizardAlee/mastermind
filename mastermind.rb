# frozen_string_literal: true

require 'colorize'
# mastermind is a game that makes a player generate random  color, and then give the other player a chance
# of up to 12 moves not, not only guess the colors, but their sequence of occurence

# colors I know
colors = ['cyan'.cyan, 'red'.red, 'green'.green, 'blue'.blue, 'white'.white, 'yellow'.yellow]

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

puts multi_rand_colors(colors)