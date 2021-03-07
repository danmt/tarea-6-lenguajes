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

  def *(complejo)
    return Complejo.new(
      (@x * complejo.x) - (@y * complejo.y),   
      (@x * complejo.y) + (@y * complejo.x)
    )
  end

  def ~@
    return Complejo.new(@x, -@y)
  end

  def /(complejo) 
    begin
      if (complejo.x == 0.0) && (complejo.y == 0.0)
        raise ZeroDivisionError end

      return Complejo.new(
        (@x * complejo.x + @y * complejo.y) / (complejo.x ** 2 + complejo.y ** 2),   
        (@y * complejo.x - @x * complejo.y) / (complejo.x ** 2 + complejo.y ** 2)
      )
    rescue ZeroDivisionError
      puts "No se puede dividir entre 0"
    end
  end
end

class Complejo2
  attr_accessor :vector

  def initialize(x, y = 0)
    @vector = Vector2.new(x, y)
  end

  def to_s()
    if (@vector.x == 0) 
      return "#{@vector.y}i"
    elsif (@vector.y == 0) 
      return "#{@vector.x}"
    elsif (@vector.y > 0)
      return "#{@vector.x}+#{@vector.y}i"
    else
      return "#{@vector.x}#{@vector.y}i"
    end
  end

  def magnitud() 
    return @vector.magnitud()
  end

  def +(complejo)
    return @vector + complejo.vector
  end

  def -(complejo)
    return @vector - complejo.vector
  end

  def ==(complejo)
    return @vector == complejo.vector
  end

  def *(complejo)
    return Complejo.new(
      (@vector.x * complejo.vector.x) - (@vector.y * complejo.vector.y),   
      (@vector.x * complejo.vector.y) + (@vector.y * complejo.vector.x)
    )
  end

  def -@
    return -@vector
  end

  def ~@
    return Complejo.new(@vector.x, -@vector.y)
  end

  def /(complejo) 
    begin
      if (complejo.vector.x == 0.0) && (complejo.vector.y == 0.0)
        raise ZeroDivisionError end

      return Complejo.new(
        (@vector.x * complejo.vector.x + @vector.y * complejo.vector.y) / (complejo.vector.x ** 2 + complejo.vector.y ** 2),   
        (@vector.y * complejo.vector.x - @vector.x * complejo.vector.y) / (complejo.vector.x ** 2 + complejo.vector.y ** 2)
      )
    rescue ZeroDivisionError
      puts "No se puede dividir entre 0"
    end
  end
end
