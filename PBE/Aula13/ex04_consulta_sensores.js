const fs = require('fs');

const json = fs.readFileSync('monitoramento.json');
const sensores = JSON.parse(json);

console.log("======= SENSORES ======")

for( let s of sensores) {
    console.log(`Código: ${s.codigo} | Tipo: ${s.tipo} | Valor: ${s.valor}${s.unidade} | Status: ${s.status}`);
}

console.log("\n===== SENSORES EM ALERTA =====");
let totalAlerta = 0;

for (let s of sensores){
    if (s.status === 'Alerta') {
        console.log(`Código: ${s.codigo} | Tipo: ${s.tipo} | Valor: ${s.valor}${s.unidade}`);
        totalAlerta++;
    }
}

console.log(`\nTotal de sensores em alerta: ${totalAlerta}`);