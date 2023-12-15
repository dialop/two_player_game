# 2-Player Math Game in Ruby

require_relative 'player'
require_relative 'game'

# Start the game with two players named "Player 1" and "Player 2"
game = Game.new("Player 1", "Player 2")
game.play