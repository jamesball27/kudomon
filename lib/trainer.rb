class Trainer

  attr_reader :name, :position, :kudomon

  def initialize(name, position)
    @name = name
    @position = position
    @kudomon = []
  end

  def catch(kudomon)
    @kudomon << kudomon if kudomon.in_range?(position)
  end
end
