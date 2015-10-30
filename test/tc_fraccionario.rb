require './lib/numeros_fraccionarios.rb'
require 'test/unit'

class Test_Fraccion < Test::Unit::TestCase
  def setup
    @origen = Numero_fraccionario.new(1,2)
    @unidad = Numero_fraccionario.new(1,1)
    @ob1 = Numero_fraccionario.new(7,6)
    @ob2 = Numero_fraccionario.new(3,2)
  end
  def test_simple
    assert_equal("1/2", @origen.to_s) #Invoco a los metodos

    assert_equal("1/1", @unidad.to_s)
  
    assert_equal("5/2", (@origen.multiplico_valor(5)).to_s, "Producto escalar")

    assert_equal("1/2",(@origen * @unidad).to_s)
    
    assert_equal("1/2", (@origen / @unidad).to_s)

    assert_equal("3/2", (@origen + @unidad).to_s)

    assert_equal("-1/2", (@origen - @unidad).to_s)

    assert_not_equal("1/3", (@origen * @unidad).to_s)
    
    assert_not_equal("3/7", (@origen * @unidad).to_s)
    
    assert_equal("7/4", (@ob1 * @ob2).to_s)
    
    assert_equal("7/9", (@ob1 / @ob2).to_s)
    
    assert_not_equal("2/3", (@ob1.multiplico_valor(7)).to_s)
  end
end