class Player
  attr_accessor :id
  attr_reader :mark

  def initialize(game)
    @@player_count ||= 0
    @@player_count += 1

    @id = @@player_count
    @mark = @@player_count == 2 ? :O : :X

    @game = game
  end

  def place_mark(board)
    input = get_mark
    coords = input.map { |s| s.to_i - 1 }

    tile_index = coords[1] * 3 + coords[0]
    if board.tiles[tile_index] == nil
      board.tiles[tile_index] = @mark
    else
      return false
    end
  end

  def check_won(board)
    lines = Game::WINNING_LINES
    marked_tiles = board.tiles.each_index.select { |i| board.tiles[i] == @mark }
    lines.any? do |line|
      (line & marked_tiles) == line
    end
  end

  def get_tile_index
    puts "It's player #{@id}'s turn."
    puts ""
    puts "Please enter the coordinates of the tile you want to mark (e.g. 2,3)"

    loop do
      # TODO add error handling
      input = gets.chomp.split(/\W+/)
      coords = input.map { |s| s.to_i - 1 }

      if @game.free_coords.include?(coords)
        return tile_index
      else
        puts "This tile is already marked, please try again:"
      end
    end


  end
end
