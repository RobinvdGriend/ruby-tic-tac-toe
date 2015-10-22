require_relative "lib/game"
require_relative "lib/player"
require_relative "lib/board"

game = Game.new
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
