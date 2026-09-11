const entrada = require('readline-sync');
const funcoes = require('./funcoesManutencao');

const maquina = entrada.question('Nome da maquina: ');
const valorPecas = entrada.questionFloat('Valor das pecas (R$): ');
const horas = entrada.questionFloat('Horas de servico: ');
const meses = entrada.questionInt('Meses desde a ultima manutencao: ');

const maoDeObra = funcoes.calcularMaoDeObra(horas);
const total = funcoes.calcularTotal(valorPecas, horas);
const garantia = funcoes.verificarGarantia(meses);

console.log('\n--- Relatório de Manutenção ---');
console.log(`Máquina: ${maquina}`);
console.log(`Mão de obra: R$ ${maoDeObra.toFixed(2)}`);
console.log(`Peças: R$ ${valorPecas.toFixed(2)}`);
console.log(`Total: R$ ${total.toFixed(2)}`);
console.log(`Situação da Garantia: ${garantia}`);