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

  def self.populate(number)
    kudomon = []

    number.times do
      species = SPECIES.keys.sample
      type = SPECIES[species]
      kudomon << Kudomon.new(species, type)
    end

    kudomon
  end

  attr_reader :species, :type, :position

  def initialize(species, type, position)
    raise "Invalid type" unless TYPES.include?(type)

    @species = species
    @type = type
    @position = position
  end
end
