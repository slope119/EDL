require 'yaml'
require 'benchmark'

# Define a função m que recebe um vetor a ser ordenado
def m(vetor)
  # Se o vetor tiver tamanho 1 ou menor, ele já está ordenado
  return vetor if vetor.size <= 1

  # Divide o vetor em duas partes
  meio = vetor.size / 2
  esq = vetor[0..meio-1]
  dir = vetor[meio..-1]

  # Recursivamente ordena as duas metades
  esq = m(esq)
  dir = m(dir)

  # Combina as duas metades ordenadas
  return merge(esq, dir)
end

# Define a função merge que recebe dois vetores ordenados
def merge(esq, dir)
  resultado = []

  # Enquanto os dois vetores não estiverem vazios
  while esq.size > 0 && dir.size > 0
    # Compara o primeiro elemento de cada vetor
    if esq[0] <= dir[0]
      # Se o primeiro elemento da esquerda for menor ou igual,
      # adiciona ele ao resultado e o remove da esquerda
      resultado << esq.shift
    else
      # Caso contrário, adiciona o primeiro elemento da direita
      # ao resultado e remove ele da direita
      resultado << dir.shift
    end
  end

  # Adiciona o restante dos elementos da esquerda, se houver algum
  resultado.concat(esq) if esq.size > 0

  # Adiciona o restante dos elementos da direita, se houver algum
  resultado.concat(dir) if dir.size > 0

  # Retorna o vetor resultado
  return resultado
end

# Exemplo de uso:
x = YAML.load_file("teste.yml") # x recebe o vetor armazenado no arquivo
puts "**Antes:**\n#{x}\n"

time = Benchmark.measure do # usa a função Beanchmark para medir o tempo gasto para ordenar o vetor
  ordenado = m(x) # chama o quick sort no array criado acima
  puts "**Depois:**\n#{ordenado}"# exibe o array ordenado
end

puts "Tempo levado para ordenar: #{time.real} segundos" #exibe o tempo gasto pelo algoritmo
