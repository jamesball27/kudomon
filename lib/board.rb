require_relative './kudomon'
require 'byebug'
class Board

  def self.populate(size = 10)
    board = Board.new(size)

    kudomon_number = (size * size) / 4
    kudomon_number.times do
      pos = board.random_position
      pos = board.random_position until board[pos].nil?

      species = Kudomon::SPECIES.keys.sample
      type = Kudomon::SPECIES[species]
      kudomon = Kudomon.new(species, type, pos)

      board[pos] = kudomon
    end

    board
  end

  attr_reader :grid, :size

  def initialize(size)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def count
    count = 0
    (0...size).each do |row|
      (0...size).each do |col|
        pos = [row, col]
        count += 1 if self[pos].is_a?(Kudomon)
      end
    end
    count
  end

  def random_position
    rand_x, rand_y = rand(0...size), rand(0...size)
    [rand_x, rand_y]
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end
end
