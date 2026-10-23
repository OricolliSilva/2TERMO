const fs = require('fs');
const producao = [
{ maquina: "Torno CNC", meta: 500, produzido: 475 },
{ maquina: "Prensa 100T", meta: 800, produzido: 820 },
{ maquina: "Fresadora", meta: 400, produzido: 290 }
];
fs.writeFileSync('producao.json', JSON.stringify(producao, null, 2));
const dados = JSON.parse(fs.readFileSync('producao.json', 'utf-8'));
let atingiramMeta = 0;
for (let i = 0; i < dados.length; i++) {
const percentual = (dados[i].produzido / dados[i].meta) * 100;
let situacao;
if (percentual >= 100) {
situacao = "META ATINGIDA";
atingiramMeta++;
} else if (percentual >= 80) {
situacao = "ATENÇÃO";
} else {
situacao = "ABAIXO DA META";
}
console.log(`\nMáquina: ${dados[i].maquina}`);
console.log(`Meta: ${dados[i].meta}`);
console.log(`Produzido: ${dados[i].produzido}`);
console.log(`Desempenho: ${percentual.toFixed(2)}%`);
console.log(`Situação: ${situacao}`);
}
console.log(`\nMáquinas que atingiram a meta: ${atingiramMeta}`);