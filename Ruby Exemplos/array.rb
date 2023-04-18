require 'yaml'

x = Array.new(100) { rand(1..100) }

File.open("teste.yml", "w") do |file|
  file.write(x.to_yaml)
end

puts "O vetor x é: #{x}"
