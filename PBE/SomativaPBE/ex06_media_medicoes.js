const entrada = require('readline-sync');

let soma = 0;

for (let i = 1; i <= 5; i++) {
    const medicao = entrada.questionFloat(`Digite a medicao ${i}: `);
    soma += medicao;
}

const media = soma / 5;

console.log(`\nSoma das medições: ${soma}`);
console.log(`Média final: ${media}`);