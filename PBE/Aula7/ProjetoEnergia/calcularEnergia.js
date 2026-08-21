const entrada = require('readline-sync')
const energia = require('./painelIndustria')

const nomeMaquina = entrada.question("Digite o nome da maquina: ");
const potencia = entrada.questionInt("Digite a potencia em Watts: ");
const horas = entrada.questionInt("Digite as horas de uso no mes: ");
const precoKwh = entrada.questionFloat("Digite o preco do kWh (R$): ");

const totalKwh = energia.calcularKwh(potencia, horas);
const custoTotal = energia.calcularCusto(totalKwh, precoKwh);
const classificacao = energia.classificarConsumo(totalKwh);

console.log("-".repeat(20));
console.log("=== RELATÓRIO DE EFICIÊNCIA ENERGÉTICA ===");
console.log(`Nome da Máquina: ${nomeMaquina.toUpperCase()}`);
console.log(`Consumo Estimado: ${totalKwh.toFixed(2)} kWh`);
console.log(`Custo Estimado: R$ ${custoTotal.toFixed(2)}`);
console.log(`Status de Consumo: ${classificacao}`);
console.log("-".repeat(20))