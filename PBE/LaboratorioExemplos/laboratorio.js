const fs = require("fs");
const texto = fs.readFileSync("maquinas.json", "utf8");
// console.log(typeof texto);
// console.log(texto);

//  texto
const maquinas = JSON.parse(texto);

maquinas.forEach((maquina, indice) => {
    console.log(`${indice + 1}. ${maquina.nome}`);
});

const procurada = maquinas.find(maquina => maquina.id === 2);
console.log(procurada); 

const procuradaTeste = maquinas.find(maquina => maquina.id === 99); // teste com id 'undefined'
if (procuradaTeste !== undefined) {
    console.log(procuradaTeste);
} else {
console.log("Máquina não encontrada.");
};

const emManutencao = maquinas.filter(
    maquina => maquina.status === "Manutenção"
);
console.log(emManutencao.length);
console.log(emManutencao);


const paradas = maquinas.filter(maquina => maquina.status === "Parada");
console.log(paradas); // - exibe []
console.log(paradas.length); // - exibe 0
// Ambos retornam vazio

// Filter seria a melhor escolha, pois filtraria e mostraria todas as máquinas com defeito

// Treino
try {
const texto = fs.readFileSync("maquinas.json", "utf8");
const maquinas = JSON.parse(texto);
console.log(`Registros carregados: ${maquinas.length}`); // exibe tamanho do array maquinas
} catch (erro) {
    console.log("Não foi possível carregar os dados.");
    console.log(erro.message);
}