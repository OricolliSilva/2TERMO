const entrada = require('readline-sync');

const listaVisitantes = [];

let continuar = entrada.question('Deseja cadastrar um novo visitante? (s/n) ');

while (continuar === 's') {
    let nome = entrada.question('Digite o nome do visitante: ');
    let empresa = entrada.question('Digite a empresa: ');

    let visitante = {
        nome: nome,
        empresa: empresa
    };

    listaVisitantes.push(visitante);

    continuar = entrada.question('Deseja cadastrar um novo visitante? (s/n) ');
}

console.log("\nLista de todos os visitantes que entraram hoje:");
console.log(listaVisitantes);