const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
    return (real / prevista) * 100;
}

function classificarEficiencia(percentual) {
    if (percentual >= 90) {
        return 'META ATINGIDA';
    } else if (percentual >= 70) {
        return 'ATENÇÃO';
    } else {
        return 'ABAIXO DA META';
    }
}

const prevista = entrada.questionFloat('Digite a producao prevista: ');
const real = entrada.questionFloat('Digite a producao real: ');

const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);

console.log(`\nProdução Prevista: ${prevista}`);
console.log(`Produção Real: ${real}`);
console.log(`Eficiência: ${percentual.toFixed(2)}%`);
console.log(`Classificação: ${classificacao}`);