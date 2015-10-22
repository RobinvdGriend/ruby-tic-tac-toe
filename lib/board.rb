class Board
  attr_accessor :tiles

  def initialize
    @tiles = build_tiles
  end

  def place_mark(coords, mark)
    tile_index = coords_to_tile_index(coords)
    tiles[tile_index] = mark
  end

  private

  def coords_to_tile_index(coords)
    coords[1] * 3 + coords[0]
  end

  def build_tiles
    Array.new(9, nil)
  end
end
