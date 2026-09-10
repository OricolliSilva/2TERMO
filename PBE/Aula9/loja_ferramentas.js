const fs = require('fs');

const produtos = [
    {id:1, nome: "Parafuso", qtde: 100},
    {id:2, nome: "Porta", qtde: 250},
    {id:3, nome: "Arruela", qtde: 50},
    {id:4, nome: "Abraçadeira", qtde: 10}
];

function salvarDados() {
    const dadosTexto = JSON.stringify(produtos, null, 2);

    fs.writeFileSync('estoque.json', dadosTexto)
    console.log("Dados salvos com sucesso no arquivo estoque.jason!")
}
function verEstoqueBaixo(){
    console.log("\n--- Produtos com estoque baixo (menos de 100) ---");

    const baixoEstoque = produtos.filter(p => p.qtde < 100);
    console.log(baixoEstoque);
}
salvarDados();
verEstoqueBaixo();