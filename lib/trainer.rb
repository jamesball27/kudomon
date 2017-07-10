class Trainer

  attr_reader :name, :kudomon
  attr_accessor :position

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
    self.kudomon
  end

  def to_s
    "T"
  end

end
