require_relative "class/game"
require_relative "class/player"
require_relative "class/board"

game = Game.new
game.run

loop do
  puts "Would you like to play again? (Y/N)"
  answer = gets.chomp
  answer.upcase!

  if answer == "Y"
    game.restart
  elsif answer == "N"
    exit
  else
    puts "Invalid input, please try again."
  end
end
