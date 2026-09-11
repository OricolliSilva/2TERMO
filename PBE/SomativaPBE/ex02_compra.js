const entrada = require('readline-sync');

const nomeMaterial = entrada.question('Digite o nome do material: ');
const quantidade = entrada.questionInt('Digite a quantidade comprada: ');
const precoUnitario = entrada.questionFloat('Digite o preco unitario: R$ ');

const valorTotal = quantidade * precoUnitario;

console.log("\n--- RESUMO DA COMPRA ---");
console.log(`Material: ${nomeMaterial}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço Unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor Total: R$ ${valorTotal.toFixed(2)}`);