const fs = require('fs')

const json = fs.readFileSync('equipamentos.json');
const objetoJson = JSON.parse(json);

function verificarArquivosJson(json) {
    if (json) {
        for (let o of json) {
            console.log(`Código: ${o.codigo}`)
            console.log(`Nome: ${o.nome}`)
            console.log(`Setor: ${o.setor}`)
            if (o.operacional === true) {
                o.operacional = "OPERACIONAL"
            } else {
                o.operacional = "PARADO"
            }
            console.log(`Status: ${o.operacional}`)
        }

    } else {
        console.log(`Arquivo nao encontrado`);
    }
};
verificarArquivosJson(objetoJson)