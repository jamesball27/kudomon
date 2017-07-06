class Trainer

  attr_reader :name, :position, :kudomon

  def initialize(name, position)
    @name = name
    @position = position
    @kudomon = []
  end

  def catch(kudomon)
    raise "Kudomon already caught" if kudomon.status == :caught
    raise "Kudomon being caught by another trainer" if kudomon.status == :being_caught

    if kudomon.in_range?(position)
      kudomon.status = :being_caught
      @kudomon << kudomon
      kudomon.status = :caught
    end
  end
end
