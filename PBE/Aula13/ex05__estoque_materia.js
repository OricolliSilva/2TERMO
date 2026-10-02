const fs = require('fs');
const materiais = [
{ codigo: 201, descricao: "Aço SAE 1020", quantidade: 50, valorUnitario: 32.50 },
{ codigo: 202, descricao: "Alumínio", quantidade: 30, valorUnitario: 28.90 },
{ codigo: 203, descricao: "Polímero ABS", quantidade: 80, valorUnitario: 12.40 }
];
fs.writeFileSync('materiais.json', JSON.stringify(materiais, null, 2));
const texto = fs.readFileSync('materiais.json', 'utf-8');
const dados = JSON.parse(texto);
let quantidadeTotal = 0;
let valorTotal = 0;
for (let i = 0; i < dados.length; i++) {
const valorItem = dados[i].quantidade * dados[i].valorUnitario;
quantidadeTotal += dados[i].quantidade;
valorTotal += valorItem;
console.log(`\n${dados[i].descricao}`);
console.log(`Quantidade: ${dados[i].quantidade}`);
console.log(`Valor unitário: R$ ${dados[i].valorUnitario.toFixed(2)}`);
console.log(`Valor em estoque: R$ ${valorItem.toFixed(2)}`);
}
console.log(`\nTipos de materiais: ${dados.length}`);
console.log(`Quantidade total: ${quantidadeTotal}`);
console.log(`Valor total: R$ ${valorTotal.toFixed(2)}`);
