class Vector2
  attr_accessor :x, :y

  def initialize(x, y)
    @x, @y = x, y
  end

  def magnitud() 
    return Math.sqrt((@x ** 2) + (@y ** 2))
  end

  def to_s()
    return "(#{@x},#{@y})"
  end
end
