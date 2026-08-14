// Desafio 2: O Gerador de Parcelas (Laços de Repetição)
// Objetivo: Praticar o uso do laço for e cálculos
// matemáticos.
// Enunciado: Uma loja de ferramentas quer mostrar ao
// cliente o valor das parcelas de uma compra. Peça o valor
// total do produto e a quantidade de parcelas (máximo 12).
// Use um loop para imprimir na tela o valor de cada parcela.
// - Exemplo: "Parcela 1: R 50,00", "Parcela 2: R 50,00"...
//-----------------------------------------------------------------------------------------

const entrada = require('readline-sync');

const valorTotal = entrada.questionFloat('Digite o valor total do produto: ');
const quantidadeDeParcelas = entrada.questionInt('Digite a quantidade de parcelas (máximo 12):'); 

const valorDaParcela = valorTotal / quantidadeDeParcelas;

for (let i = 1; i <= quantidadeDeParcelas; i++) {
    console.log(`Parcela ${i}: R$ ${valorDaParcela.toFixed(2)}`);
} 

