const entrada = require ('readline-sync');

const idade = entrada.questionInt('Qual a sua idade?');
const autorizacao = entrada.question('Você tem autorização? S/N');
const acompanhado = entrada.question('Você está acompanhado? S/N');

if( (idade >=16 && autorização === "S") || acompanhado=== 'S' ) {
    console.log(`ACESSO LIBERADO!`); 
} else {
    console.log(`ACESSO NEGADO!`);
}
