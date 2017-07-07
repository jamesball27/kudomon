class Trainer

  DEFAULT_NAMES = ["James", "Freddy", "Matt"]

  attr_reader :name, :position, :kudomon

  def initialize(name, position)
    @name = name
    @position = position
    @kudomon = []
  end

  def catch(kudomon)
    raise "Kudomon not in range" unless kudomon.in_range?(position)
    raise "Kudomon already caught" if kudomon.status == :caught
    raise "Kudomon being caught by another trainer" if kudomon.status == :being_caught

    kudomon.status = :being_caught
    @kudomon << kudomon
    kudomon.status = :caught
  end

end
