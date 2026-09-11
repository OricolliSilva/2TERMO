const entrada = require('Readline-sync');

const nome = entrada.question("Nome do usuario: ");
const ano_nascimento = entrada.questionInt("Ano de nascimento: ");

const ano = 2026

const idade = ano - ano_nascimento
if (idade >= 16 ) {
    console.log('\nVocê ja tem a idade minima para votar!')

} else {
    console.log('\nVocê ainda não tem idade para votar!')
} 