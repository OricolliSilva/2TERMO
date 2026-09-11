const entrada = require('readline-sync');

const operadores = [];

for (let i = 1; i <= 5; i++) {
    const nome = entrada.question(`Digite o nome do operador ${i}: `);
    operadores.push(nome);
}

console.log('\n --- Lista dos Operadores ---')

for (let i = 0; i < operadores.length; i++) {
    console.log(`${i + 1} - ${operadores[i]}`);
}