const fs = require('fs');
const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===\n");

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const termoBusca = entrada.question("Digite a quantidade limite para buscar: ");

    const resultado = produtos.filter(p => p.qtde < termoBusca);

    console.log(`\n--- Produtos com estoque menor que ${termoBusca} ---`);
    console.log(resultado);

} catch(erro) {
    console.log("Erro ao acessar o banco de dados: "+ erro.message);
}