# Tarea 6 de Lenguajes

- Denylson Romero 13-11270
- Daniel Marin 10-10419

## Ejercicio 0.

### Implementación de Vector2

```ruby
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
```

### Complejo como subclase de Vector2

```ruby
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
```

### Complejo usando composición

```ruby
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
```

### Composición vs Jerarquía

Dados Vector2 y Complejo, podemos ver que hay una relacion bastante estrecha entre ambos. Misma cantidad de propiedades, los metodos son iguales excepto la multiplicación y en Complejo tenemos 2 metodos extra "conjugado" y "división".

Teniendo tantas similitudes entre ambas clases, reducimos considerablemente la cantidad de codigo usando jerarquía. Si bien, usar jerarquía es una practica válida, puede llevar a programas dificiles de mantener, donde un cambio en una super clase afecta el comportamiento las subclases.

En el caso de esta implementacion de Complejo usando Composición, re-usamos los metodos de Vector2, una mejor solucion incluiria una nueva clase "Operaciones", que cuenta con una serie de metodos para realizar la aritmetica. Usando la clase Operaciones, podemos componer Vector2 y Complejo usando esta nueva clase, resultando en un codigo un poco mas mantenible.

## Ejercicio 1

Un lenguaje puramente funcional puede ser definido como un lenguaje donde no se permiten los cambios de estado ni datos mutables. Tomando esta definición en cuenta, estrictamente hablando, no tiene sentido un lenguaje puramente funcional orientado a objetos, ya que la orientación a objetos permite la mutabilidad de los datos, lo cuál contradice la definición de un lenguaje puramente funcional.

Además, la programación funcional sigue un modelo declarativo que se enfoca en “qué haces en el programa”, mientras la programación orientada a objetos sigue un modelo imperativo, donde el enfoque es “cómo haces el programa”.

También cabe destacar que la programación puramente funcional permite paralelismo, mientras la programación orientada a objetos no lo permite nativamente, sino que necesita hacer uso de otros paradigmas para poder lograr el paralelismo, como openMP y MPI.
