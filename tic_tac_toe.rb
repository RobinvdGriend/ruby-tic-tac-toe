require_relative "class/game"
require_relative "class/player"
require_relative "class/board"

players = Array.new(2) { Player.new }
board = Board.new

game = Game.new(players: players, board: board)
game.run

loop do
  puts "Would you like to play again? (Y/N)"
  answer = gets.chomp
  answer.upcase!

  if answer == "Y"
    game.restart(Board.new)
  elsif answer == "N"
    exit
  else
    puts "Invalid input, please try again."
  end
end
