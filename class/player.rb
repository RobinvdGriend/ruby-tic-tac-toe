class Player
  attr_accessor :id
  attr_reader :mark

  def initialize
    @@player_count ||= 0
    @@player_count += 1
    @id = @@player_count
    @mark = @@player_count == 2 ? :O : :X
  end

  def place_mark(input, board)
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
end
