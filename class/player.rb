class Player
  attr_accessor :id
  attr_reader :mark

  def initialize
    @@player_count ||= 0
    @@player_count += 1
    @id = @@player_count
    @mark = @@player_count == 2 ? :O : :X
  end

  def place_mark(coords, board)
    tile_index = coords[0] * 3 + coords[1]
    board.tiles[tile_index] = @mark
  end

  def check_won(board)
    lines = Game::WINNING_LINES
    marked_tiles = board.tiles.each_index.select { |i| board.tiles[i] == @mark }
    lines.any? do |line|
      (line & marked_tiles) == line
    end
  end
end
