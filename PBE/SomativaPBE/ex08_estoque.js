const entrada = require('readline-sync');

const estoque = [];

for (let i = 1; i <= 3; i++) {
    console.log(`--- Cadastro do Componente ${i} ---`);
    const nome = entrada.question('Nome do componente: ');
    const quantidade = entrada.questionInt('Quantidade em estoque: ');
    const estoqueMinimo = entrada.questionInt('Estoque minimo: ');

    const componente = {
        nome: nome,
        quantidade: quantidade,
        estoqueMinimo: estoqueMinimo
    };

    estoque.push(componente);
    console.log('');
}

console.log('\n --- Relatório do estoque ---')

for(let i = 0; i < estoque.length; i++){
    const item = estoque[i];
    console.log(`Componente: ${item.nome} | Qtd: ${item.quantidade} |Mín: ${item.estoqueMinimo}`);

    if (item.quantidade < item.estoqueMinimo) {
        console.log('Status: REPOR ESTOQUE');
}else {
    console.log('ESTOQUE OK')
}
}