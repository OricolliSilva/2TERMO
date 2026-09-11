const entrada = require('readline-sync');

const temperatura = entrada.questionFloat('Digite a temperatura da maquina: ');

console.log(`\nTemperatura: ${temperatura}°C`);

if (temperatura <= 60) {
    console.log('Situação: NORMAL');
} else if (temperatura <= 80) {
    console.log('Situação: ATENÇÃO');
} else {
    console.log('Situação: CRÍTICA');
}