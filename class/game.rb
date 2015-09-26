class Game
  WINNING_LINES = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 5]
          ]
  EXIT_COMMANDS = ["quit", "q"]

  def initialize
    @player_1 = create_player
    @player_2 = create_player
    @board = create_board
  end

  def run
    print_welcome
    loop do
      print_board

      input = get_input

      if EXIT_COMMANDS.include?(input[0])
        break
      end
    end
  end

  private

  def create_player
    Player.new
  end

  def create_board
    Board.new
  end

  def print_welcome
    puts "---------Welcome to Tic Tac Toe!---------"
    puts "Made by: RobinvdGriend"
    puts " Github: https://github.com/RobinvdGriend"
    puts "-----------------------------------------"
  end

  def print_board
    puts "+---+---+---+"
    @board.tiles.each_slice(3) do |row|
      print "|"
      row.each do |mark|
        if mark == nil
          print "   |"
        else
          print " #{mark} |"
        end
      end
      print "\n"
      puts "+---+---+---+"
    end
  end

  def get_input
    puts "Please enter the coordinates in the field you want to mark (e.g. 2,3)"
    puts "Enter \"quit\" or \"q\" to exit"
    # TODO add error handling
    gets.chomp.split(/\W+/)
  end
end
