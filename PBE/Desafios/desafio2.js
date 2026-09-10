const entrada = require('readline-sync');

const valor_sem_desconto = entrada.question("Qual foi o valor total da conta?: \n")

const valor_com_desconto = (10 / 100) * valor_sem_desconto 
const diferenca = valor_sem_desconto - valor_com_desconto

if  (valor_sem_desconto >= 100){
    console.log(`A sua conta teve um desconto de 10%! Aqui está o valo total com desconto: ${diferenca}`);

} else {
   console.log(`A sua conta não teve desconto! Aqui está o valor a pagar: ${valor_sem_desconto}`); 
}