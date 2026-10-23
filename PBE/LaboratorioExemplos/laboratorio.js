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

// Desafios

// Desafio A - Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o array carregado do JSON.
console.log("------------------------------")
console.log("Maquinas Cadastradas")
console.log("\nID | Nome      | Status");
maquinas.forEach(maquina => {
    console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
});

// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não existir, apresente uma mensagem amigável.
const id = 2;
const maquinaAchada = maquinas.find(maquina => maquina.id === id);
if (maquinaAchada === undefined) {
    console.log("\nMaquina nao foi encontrada.");
} else {
    console.log("------------------------------")
    console.log(`\nID: ${maquinaAchada.id}`);
    console.log(`Nome: ${maquinaAchada.nome}`);
    console.log(`Setor: ${maquinaAchada.setor}`);
    console.log(`Status: ${maquinaAchada.status}`);
};

// Desafio C - Intermediário. Crie uma variável com o nome de um setor. Exiba quantas máquinas pertencem a ele e os nomes encontrados.
const nomeSetor = "Montagem";
const maquinaPorSetor = maquinas.filter(maquina => maquina.setor === nomeSetor);

if (maquinaPorSetor[0] === undefined) {
    console.log("\nMaquina nao encontrada.");
} else {
    console.log("------------------------------")
    console.log(`Busca por setor: ${nomeSetor}`);
    console.log(`Quantidade de maquinas: ${maquinaPorSetor.length}`)
    for (let m of maquinaPorSetor) {
        console.log(`\nID: ${m.id}`);
        console.log(`Nome: ${m.nome}`);
        console.log(`Setor: ${m.setor}`);
        console.log(`Status: ${m.status}`);
    };
};

// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array filtrado. Teste com status existente e inexistente.
function receberStatus(status) {
    const maquinasEncontradas = maquinas.filter(maquina => maquina.status === status);
    
    if (maquinasEncontradas[0] === undefined) {
        console.log("\nMaquina nao encontrada.");
    } else {
        console.log("------------------------------");
        for (let m of maquinasEncontradas) {
            console.log(`\nID: ${m.id}`);
            console.log(`Nome: ${m.nome}`);
            console.log(`Setor: ${m.setor}`);
        };
    };
};

receberStatus("Ativa"); // Existente - exibe o array formatado
receberStatus("aRiVo") // Inexistente - exibe 'Maquina nao encontrada.'