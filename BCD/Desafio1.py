# Desafio 1: Condicionais e Operações (O Aluguel de Carro)
# Enunciado em Python: Escreva um programa em Python que receba o número
# de dias que um carro foi alugado e a quantidade de Km rodados.
# - O aluguel custa R$ 90,00 por dia.
# - Se o cliente rodou até 100 km no total, paga R$ 0,20 por Km rodado.
# - Se rodou mais de 100 km, paga R$ 0,15 por Km rodado.
# Exiba o valor total a pagar formatado com duas casas decimais.
# - O que avalia no aluno: Variáveis, conversão de tipos (float/int), condicionais
# (if/else) e cálculos matemáticos. 
   
aluguel = 90
dias = int(input("Digite o número de dias que o carro foi alugado: "))
km = float(input("Digite a quantidade de Km rodados: "))

if km <= 100:
    valor_km = km * 0.20
else:
    valor_km = km * 0.15

valor_total = (dias * aluguel) + valor_km
print(f"o valor total a pagar é: R$ {valor_total:.2f}")

# ------------------------------------------------------------------------------------------------------------------

# Desafio 2: Repetição e Listas (O Filtro de Pares)
# Enunciado em Python: Dado o seguinte código inicial com uma lista de
# números:
# numeros = [12, 5, 8, 21, 14, 3, 10, 7]
# Escreva um programa que:
# 1. Percorra a lista e crie uma nova lista contendo apenas os números pares.
# 2. Calcule e exiba a média desses números pares.
# - O que avalia no aluno: Laços de repetição (for), listas, método .append(),
# acúmulo de valores e o operador de resto de divisão %.

numeros = [12, 5, 8, 21, 14, 3, 10, 7]
pares = []

for num in numeros:
    if num % 2 == 0:
        pares.append(num) #append serve para colocar a informação pedida dentro do espaço vazio

media = sum(pares) / len(pares)
print(f"Pares: {pares}")
print(f"Média os pares: {media:.2f}")

#-----------------------------------------------------------------------------------------------------------------------------
# Desafio 3: Funções e Dicionários (O Desconto no Produto)
# Enunciado em Python: Crie um dicionário representando um produto: produto =
# {&quot;nome&quot;: &quot;Teclado Mecânico&quot;, &quot;preco&quot;: 200.0, &quot;estoque&quot;: 15}
# 1. Crie uma função chamada aplicar_desconto que receba o dicionário do
# produto
# e a porcentagem de desconto (ex: 10 para 10%).
# 2. A função deve atualizar o preço do produto dentro do dicionário e exibir a
# mensagem: &quot;O produto [NOME] agora custa R$ [NOVO_PRECO]!”
 
prouto = {"nome": "teclado Mecânico", "preco": 200.0, "estoque": 15, "categoria": "Perifericos"}

def aplicar_desconto(produto, porcentagem):
    desconto = produto["preco"] * (porcentagem / 100)
    produto["preco"] -= desconto
    print(f"O produto {produto['nome']} agora custa R$ {produto['preco']:.2f}!")

aplicar_desconto(prouto, 10) 