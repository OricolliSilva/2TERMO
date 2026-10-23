const entrada = require('readline-sync');
const conversor = require('./conversor');

const valorDolar = entrada.questionFloat("Digite o valor em Dolar: U$ ");

const valorReal = conversor.converterDolarParaReal(valorDolar);

console.log(`Valor em Real: R$ ${valorReal.toFixed(2)}`);