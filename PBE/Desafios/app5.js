const entrada = require('readline-sync');

console.log("--- SISTEMA DE ANALISE DE CREDITO ---");

// Coleta de dados
const nome = entrada.question("Nome do cliente: ");
const idade = entrada.questionInt("Idade: ");
const renda = entrada.quentionFloat("Rensa mensal: ");
const temImovel = entrada.keyInYNStrict("Possui imovel propio? "); //

// A lógica Combinada
// (idade >= 18) é obrigatótio 
// (renda >= 2500 || temImovel == true) um dos dois tem que ser verdade
if (idade >= 18 && (renda >= 2500 || temImovel === True)) {
    console.log('\nPARABENS, &{nome}! Seu credito foi APROVADO!')

} else {
    console.log('\nSinto muito &{nome}. Seu credito foi NEGADO')
} 