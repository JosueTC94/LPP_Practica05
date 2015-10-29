task :default => :tu

desc "Pruebas unitarias de la clase Numero_fraccionario"
task :tu do
  sh "ruby -I. test/tc_fraccionario.rb"
end

desc "Ejecutar solo las pruebas simples"
task :simple do
  sh "ruby -I. test/tc_fraccionario.rb -n /simple/"
end