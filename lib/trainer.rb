class Trainer

  attr_reader :name, :position, :kudomon

  def initialize(name, position)
    @name = name
    @position = position
    @kudomon = []
  end

  def catch(kudomon)
    if kudomon.in_range?(position)
      @kudomon << kudomon
    end
  end

  def nearby_kudomon
    
  end
end
