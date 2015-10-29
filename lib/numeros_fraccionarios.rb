
require './lib/gcd.rb'

class Numero_fraccionario
  attr_accessor :numerador, :denominador
  def initialize(numerador, denominador)
    @numerador, @denominador = numerador, denominador
  end
  def to_s
    "#{@numerador}/#{@denominador}"
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
          denominador_comun = @denominador * other.denominador;
          @numerador = (@numerador*(denominador_comun/@denominador))
          @denominador = denominador_comun
          other.numerador = other.numerador*(denominador_comun/other.denominador)
          other.denominador = denominador_comun
          Numero_fraccionario.new(@numerador-other.numerador/gcd(@numerador+other.numerador,denominador_comun),denominador_comun/gcd(@numerador-other.numerador,denominador_comun))
    end
  end
  def * (other)
    aux = gcd(@numerador * other.numerador,@denominador*other.denominador)
    Numero_fraccionario.new((@numerador * other.numerador)/aux, (@denominador * other.denominador)/aux)
  end
  def / (other)
      aux = gcd(@numerador * other.denominador,@denominador*other.numerador)
      Numero_fraccionario.new((@numerador * other.denominador)/aux, (@denominador * other.numerador)/aux)
  end  
end