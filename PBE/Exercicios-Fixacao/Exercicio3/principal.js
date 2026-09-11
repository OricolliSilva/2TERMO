const entrada = require('readline-sync');
const sensor = require('./sensor');

const temp = entrada.questionFloat("Digite a temperatura: ");
const umid = entrada.questionFloat("Digite a umidade: ");

const alertaTemp = sensor.checarTemperatura(temp);
const alertaUmid = sensor.checarUmidade(umid);

if (alertaTemp) {
    console.log(alertaTemp);
}

if (alertaUmid) {
    console.log(alertaUmid);
}

