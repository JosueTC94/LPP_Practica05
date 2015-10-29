require '../lib/numeros_fraccionarios.rb'
require 'test/unit'

class Test_Fraccion < Test::Unit::TestCase
  def setup
    @origen = Numero_fraccionario.new(1,2)
    @unidad = Numero_fraccionario.new(1,1)
  end
  def test_simple
    assert_equal(Numero_fraccionario.new(1,2).to_s, @origen.to_s) #Invoco a los metodos
    assert_equal(Numero_fraccionario.new(1,1).to_s, @unidad.to_s,"Holaaaaa")
    assert_equal((Numero_fraccionario.new(5,2)).to_s, (@origen.multiplico_valor(5)).to_s, "Producto escalar")
    assert_equal("3/2", (@origen + @unidad).to_s)
    assert_equal("-1/2", (@origen - @unidad).to_s)
    assert_not_equal("1/3", (@origen * @unidad).to_s)
    assert_equal("1/2",(@origen * @unidad).to_s)
    assert_equal("1/2", (@origen / @unidad).to_s)
  end
end