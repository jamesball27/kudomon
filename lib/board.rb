require_relative './kudomon'
require_relative './trainer'

class Board

  def self.default
    board = Board.new
    board.populate_random_kudomon
    board.populate_default_trainer
    board
  end

  attr_reader :grid, :size, :trainer

  def initialize(size = 10)
    @grid = Array.new(size) { Array.new(size) }
    @size = size
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

  def populate_default_trainer
    trainer_pos = random_nil_position
    @trainer = Trainer.new("James", trainer_pos)
    self[trainer_pos] = @trainer
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

  def render
    grid.each do |row|
      puts row.map { |el| el.nil? ? " " : el.to_s }.join
    end
  end

  def move_trainer(direction)
    self[trainer.position] = nil
    new_pos = get_position(direction)
    raise "Invalid move" unless valid_move?(new_pos)

    trainer.position = new_pos
    self[new_pos] = trainer
    self
  end

  def catch_kudomon(direction)
    kudomon_pos = get_position(direction)
    trainer.catch(self[kudomon_pos])
    self[kudomon_pos] = nil
    self
  end

  def get_position(direction)
    deltas = {
      n: [-1, 0],
      s: [1, 0],
      e: [0, 1],
      w: [0, -1]
    }

    trainer_x, trainer_y = trainer.position
    dx, dy = deltas[direction]
    [trainer_x + dx, trainer_y + dy]
  end

  def valid_move?(pos)
    self[pos].nil?
  end

end
