class Game
  WINNING_LINES = [
            [0, 1, 2], [3, 4, 5], [6, 7, 8],
            [0, 3, 6], [1, 4, 7], [2, 5, 8],
            [0, 4, 8], [2, 4, 5]
          ]

  def initialize
    @players = Array.new(2, Player.new(self)).cycle
    @board = Board.new
  end

  def restart
    @board = Board.new
    @players.rewind

    run
  end

  def run
    print_welcome

    turns = 1
    loop do
      print_board

      current_player = @players.next

      player_tile

      if current_player.check_won(@board)
        print_board
        puts "Congratulations: player #{current_player.id} has won!"
        return
      elsif turns == 9
        puts "It's a tie!"
        return
      else
        turns += 1
      end
    end
  end

  private

  def print_welcome
    puts "---------Welcome to Tic Tac Toe!---------"
    puts "Made by: RobinvdGriend"
    puts " Github: https://github.com/RobinvdGriend"
    puts "-----------------------------------------"
  end

  def print_board
    puts "   1   2   3  "
    puts " +---+---+---+"

    row_num = 0
    @board.tiles.each_slice(3) do |row|
      row_num += 1
      print "#{row_num}|"

      row.each do |mark|
        if mark == nil
          print "   |"
        else
          print " #{mark} |"
        end
      end

      print "\n"
      puts " +---+---+---+"
    end
  end


end
