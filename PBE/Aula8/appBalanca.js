const entrada = require('readline-sync');
const balanca = require('./funcoesBalanca');

let sistemaAtivo = true;

while (sistemaAtivo) {

    try {
        const leituraPeso = entrada.question("Digite o peso da peca (g): ");

        if (leituraPeso.toLowerCase() === 'sair') {
            sistemaAtivo = false;
            break;
        }

        const peso = Number(leituraPeso);

        if (isNaN(peso)) {
            throw new Error("Entrada invalida! Digite apenas numeros!");
        }

        console.log(balanca.verificarPeso(peso));

    } catch (erro) {
        console.log(`ALERTA: ${erro.message}`);
    }
}