const entrada = require('readline-sync');

const nome = entrada.question("Nome do usuario: ");
const renda = entrada.questionFloat("Qual sua renda mensal?: ");
const nome_sujo = entrada.question("Seu nome está limpo? (y/n)?:");

if (renda >= 2000 && nome_sujo === "true") {
    console.log(`\n${nome}, emprestimo Aprovado!`);
} else {
    console.log(`\nSinto muito, ${nome}. Emprestimo negado!`);
}
