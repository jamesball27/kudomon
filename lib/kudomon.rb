class Kudomon
  SPECIES = {
    "Sourbulb" => :grass,
    "Mancharred" => :fire,
    "Chikapu" => :electric,
    "Skwertle" => :water,
    "Gemguy" => :rock,
    "Mewthree" => :psychic
  }

  TYPES = %i{grass fire electric water rock psychic}

  attr_reader :species, :type, :position
  attr_accessor :status

  def initialize(species, type, position)
    raise "Invalid type" unless TYPES.include?(type)

    @species = species
    @type = type
    @position = position
    @status = :free
  end

  def in_range?(trainer_position)
    deltas = [
      [-1, -1],
      [-1, 0],
      [0, -1],
      [0, 1],
      [1, 0],
      [1, 1]
    ]

    trainer_x, trainer_y = trainer_position
    deltas.each do |(dx, dy)|
      return true if [trainer_x + dx, trainer_y + dy] == position
    end

    false
  end
end
