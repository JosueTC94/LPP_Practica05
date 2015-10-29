#require test/unit

class Numero_fraccionario
  attr_accessor :numerador, :denominador, :num, :den
  def initialize(numerador, denominador)
    @numerador, @denominador = numerador, denominador
  end
  def to_s
    "#{@numerador}/#{@denominador}"
  end
  def devolver_numerador
    @numerador
  end
  def devolver_denominador
    @denominador
  end
  def multiplico_valor(value) #Producto escalar --> mcm
    Numero_fraccionario.new(@numerador * value, @denominador)
  end
  def + (other) #Suma
    aux = gcd(@numerador,@denominador)
    aux1 = gcd(other.numerador,other.denominador)
    @numerador = (@numerador/aux)
    @denominador = (@denominador/aux)
    other.numerador = (other.numerador / aux1)
    other.denominador = (other.denominador / aux1)
    if(@denominador == other.denominador)
          Numero_fraccionario.new(@numerador + other.numerador, @denominador)
    else
          aux2 = @denominador * other.denominador;
          @numerador = (@numerador*(aux2/@denominador))
          @denominador = aux2
          other.numerador = other.numerador*(aux2/other.denominador)
          other.denominador = aux2
          Numero_fraccionario.new(@numerador+other.numerador/gcd(@numerador+other.numerador,aux2),aux2/gcd(@numerador+other.numerador,aux2))
    end
  end
  def - (other) #Resta --> mcm
    aux = gcd(@numerador,@denominador)
    aux1 = gcd(other.numerador,other.denominador)
    @numerador = (@numerador/gcd(@numerador,@denominador))
    @denominador = (@denominador/aux)
    other.numerador = other.numerador / aux1
    other.denominador = other.denominador / aux1
    if(@denominador == other.denominador)
          Numero_fraccionario.new(@numerador - other.numerador, @denominador)
    else
          aux2 = @denominador * other.denominador;
          @numerador = (@numerador*(aux2/@denominador))
          @denominador = aux2
          other.numerador = other.numerador*(aux2/other.denominador)
          other.denominador = aux2
          Numero_fraccionario.new(@numerador-other.numerador/gcd(@numerador+other.numerador,aux2),aux2/gcd(@numerador-other.numerador,aux2))
    end
  end
  def * (other)
    Numero_fraccionario.new(@numerador * other.numerador, @denominador * other.denominador)
  end
  def / (other)
      Numero_fraccionario.new(@numerador * other.denominador, @denominador * other.numerador)
  end  
end

#Defino un metodo
def gcd(u,v)
  u, v = u.abs, v.abs
  while v != 0
    u, v = v, u % v
  end
  u
end

def mcm(den1,den2)
  aux = 1
  count = 1
  while((aux%den2)!=0)
    aux = count*den1
    count+=1
  end
  aux
end

ob1 = Numero_fraccionario.new(6,5)
ob2 = Numero_fraccionario.new(8,4)
puts ob1.to_s
puts "\n"
puts "Multiplico por escalar"+(ob2.multiplico_valor(3)).to_s
puts "\n"
puts "Multiplicacion de los objetos"+(ob1.*(ob2)).to_s
puts "Division de los objetos"+(ob1./(ob2)).to_s
puts "\n"

puts "\n\n\n"
puts "Resta:"
puts "\n"
puts ob1.+(ob2)
puts "\n"
puts mcm(4,7)


