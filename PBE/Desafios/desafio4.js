const entrada = require('readline-sync');

const nome = entrada.question('Qual o seu nome? \n');
const idade = entrada.question('Qual sua idade? \n');

if (idade >= 5 && (idade <=10)) {
    console.log("Voce esta na categoria infantil!");
}
else if (idade >= 11 && (idade <=17)) {
    console.log("Voce esta na categoria juvenil!");
}
else if (idade >= 18 && (idade <=60)) {
    console.log("Voce esta na categoria adulto!");
}
else {
    console.log("Voce esta na categoria senior!");
}