const entrada = require('readline-sync');

const pecasCiclo = entrada.questionInt('Digite a quantidade de pecas produzidas por ciclo: ');

for (let i = 1; i <= 10; i++) {
    const producaoAcumulada = pecasCiclo * i;
    console.log(`Ciclo ${i}: ${producaoAcumulada} peças acumuladas`);
}