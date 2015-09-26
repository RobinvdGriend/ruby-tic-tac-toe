class Board
  attr_accessor :tiles

  def initialize
    @tiles = build_tiles
  end

  def build_tiles
    Array.new(9, nil)
  end
end
