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

  def +(vector)
    return Vector2.new(@x + vector.x, @y + vector.y)
  end

  def -(vector)
    return Vector2.new(@x - vector.x, @y - vector.y)
  end

  def ==(vector)
    return @x == vector.x && @y == vector.y
  end

  def *(vector)
    return @x * vector.x + @y * vector.y
  end

  def -@
    return Vector2.new(-@x, -@y)
  end
end

class Complejo < Vector2
  def initialize(x, y = 0)
    super(x, y)
  end

  def to_s()
    if (@x == 0) 
      return "#{@y}i"
    elsif (@y == 0) 
      return "#{@x}"
    elsif (@y > 0)
      return "#{@x}+#{@y}i"
    else
      return "#{@x}#{@y}i"
    end
  end
end
