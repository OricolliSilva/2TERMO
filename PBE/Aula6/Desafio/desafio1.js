// Desafio 1: O Verificador de Aposentadoria (Lógica e Decisão)
// Objetivo: Praticar cálculos, if/else e operadores lógicos.
// Enunciado: Crie um programa que peça o nome, a idade e o
// tempo de contribuição de um trabalhador. A regra para se
// aposentar é:
// - Ter pelo menos 65 anos de idade.
// - OU ter pelo menos 30 anos de contribuição. Exiba uma
// mensagem dizendo se o trabalhador já pode se aposentar ou
// não.
//-------------------------------------------------------------------------------------------





const entrada = require ('readline-sync');

const idade = entrada.questionInt('Qual a sua idade? \n');
const contribuicao = entrada.question('Contribuiu por quantos anos? \n');

if( (idade >=65) || contribuicao >=30 ) {
    console.log(`PODE APOSENTAR!`); 
} else {
    console.log(`NÃO PODE APOSENTAR!`);
}
