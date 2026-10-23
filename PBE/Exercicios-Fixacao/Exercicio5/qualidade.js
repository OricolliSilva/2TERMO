const entrada = require('readline-sync');

const pecasDefeituosas = [];

const quantidade = entrada.questionInt('Quantas pecas com defeito foram encontradas? ');

for (let i = 0; i < quantidade; i++) {
    let numeroSerie = entrada.question(`Digite o numero de serie da peca ${i + 1}: `);
    pecasDefeituosas.push(numeroSerie);
}

console.log(`Total de peças: ${pecasDefeituosas.length} - Números de série:`);
console.log(pecasDefeituosas);