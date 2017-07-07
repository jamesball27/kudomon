require_relative './kudomon'
require_relative './trainer'

class Board

  def self.default
    board = Board.new
    board.populate_random_kudomon
    board.populate_default_trainers
    board
  end

  attr_reader :grid, :size

  def initialize(size = 10)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
  end

  def trainer_count
    count = 0
    (0...size).each do |row|
      (0...size).each do |col|
        pos = [row, col]
        count += 1 if self[pos].is_a?(Trainer)
      end
    end
    count
  end

  def kudomon_count
    count = 0
    (0...size).each do |row|
      (0...size).each do |col|
        pos = [row, col]
        count += 1 if self[pos].is_a?(Kudomon)
      end
    end
    count
  end

  def populate_random_kudomon(number = 25)
    number.times do
      pos = random_nil_position
      species = Kudomon::SPECIES.keys.sample
      type = Kudomon::SPECIES[species]
      hp = rand(10..100)
      cp = rand(1..25)
      kudomon = Kudomon.new(species, type, pos, hp, cp)
      self[pos] = kudomon
    end

    self
  end

  def populate_default_trainers
    Trainer::DEFAULT_NAMES.each do |name|
      trainer_pos = random_nil_position
      trainer = Trainer.new(name, trainer_pos)
      self[trainer_pos] = trainer
    end

    self
  end

  def random_nil_position
    pos = random_position
    pos = random_position until self[pos].nil?
    pos
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
