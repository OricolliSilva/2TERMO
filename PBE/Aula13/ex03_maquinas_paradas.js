const fs = require('fs');

const json = fs.readFileSync('equipamentos.json');
const objetoJson = JSON.parse(json);

let parados = 0;

console.log('=== EQUIPAMENTOS PARADOS ===\n');

for (let o of objetoJson) {
  if (o.operacional === false) {
    console.log(`${o.nome} - ${o.setor}`);
    parados++; 
  }
}

console.log(`\nTotal de equipamentos parados: ${parados}`);