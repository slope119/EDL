require 'yaml'
require 'benchmark'

def q(arr)
  # verifica se o array está vazio ou possui apenas um elemento
  return arr if arr.length <= 1

  # define o pivô como o elemento central do array
  pivot = arr[arr.length / 2]

  # declaração dos arrays menores e maiores que o pivô
  esq = []
  dir = []
  
  # declaração do array com os elementos iguais ao pivô
  pivot_elements = []

  # itera sobre o array, colocando cada elemento em um dos três arrays declarados acima
  arr.each do |x|
    if x < pivot
      esq << x
    elsif x > pivot
      dir << x
    else
      pivot_elements << x
    end
  end
  
  # recursão para chamar o quick sort nos arrays menores e maiores que o pivô
  # concatena o resultado com os elementos iguais ao pivô no meio
  return q(esq) + pivot_elements + q(dir)
end

# exemplo de uso
x = YAML.load_file("teste.yml") # x recebe o vetor armazenado no arquivo
puts "**Antes:**\n#{x}\n"

time = Benchmark.measure do # usa a função Beanchmark para medir o tempo gasto para ordenar o vetor
  ordenado = q(x) # chama o quick sort no array criado acima
  puts "**Depois:**\n#{ordenado}"# exibe o array ordenado
end

puts "Tempo levado para ordenar: #{time.real} segundos" #exibe o tempo gasto pelo algoritmo