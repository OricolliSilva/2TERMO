// Desafio 3: Calculadora de Área de Terrenos (Funções)
// Objetivo: Criar uma função que recebe parâmetros e
// retorna um valor.
// Enunciado: Crie uma função chamada calcularArea que
// receba a largura e o comprimento de um terreno e retorne
// a área total (largura * comprimento). No programa
// principal, peça os dados de 3 terrenos diferentes ao
// usuário, chame a função para cada um e mostre o
// resultado.
//-----------------------------------------------------------------------------------------

const entrada = require('readline-sync');

function calcularArea(n1, n2) {
    return n1 * n2;
}

const larguraTerreno1 = entrada.questionFloat("Digite a largura do terreno: \n");
const comprimentoTerreno1 = entrada.questionFloat("Digite o comprimento do terreno: \n");

const larguraTerreno2= entrada.questionFloat("Digite a largura do terreno: \n");
const comprimentoTerreno2 = entrada.questionFloat("Digite o comprimento do terreno: \n");

const larguraTerreno3 = entrada.questionFloat("Digite a largura do terreno: \n");
const comprimentoTerreno3= entrada.questionFloat("Digite o comprimento do terreno: \n");
 
const areaTerreno1 = calcularArea(larguraTerreno1, comprimentoTerreno1);
console.log(`A area do primeiro terreno é: ${areaTerreno1.toFixed(1)}`);
const areaTerreno2= calcularArea(larguraTerreno2, comprimentoTerreno2);
console.log(`A area do segundo terreno é: ${areaTerreno2.toFixed(1)}`);
const areaTerreno3 = calcularArea(larguraTerreno3, comprimentoTerreno3);
console.log(`A area do terceiro terreno é: ${areaTerreno3.toFixed(1)}`);
