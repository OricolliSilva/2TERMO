const fs = require('fs');

console.log("=== SISTEMA DE ALERTA DE MANUTENÇÃO ===\n");

try {
    const dadosTexto = fs.readFileSync('maquinas.json', 'utf-8');
    const maquinas = JSON.parse(dadosTexto);

    const maquinasEmPerigo = maquinas.filter(m => m.horasUso > 1000);

    console.log("Máquinas em perigo (mais de 1000h de uso):");
    console.log(maquinasEmPerigo);

    const dadosSalvar = JSON.stringify(maquinasEmPerigo, null, 2);
    fs.writeFileSync('manutencao_urgente.json', dadosSalvar);

    console.log("\nDados salvos com sucesso no arquivo manutencao_urgente.json!");

} catch (erro) {
    console.log("Erro ao processar o banco de dados: " + erro.message);
}