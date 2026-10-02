const fs = require('fs');

const temperaturas = [180, 250, 390, 210];
fs.writeFileSync('temperaturas.json', JSON.stringify(temperaturas, null, 2));

try{
    const texto = fs.readFileSync('temperaturas.json', utf-8);
    const leituras = JSON.parse(texto);

    for (let i = 0; i <leituras.lenght; i++) {
        if (leituras[i] > 350) {
            throw new Error(
                `Temperatura de ${Leitura[i]}°C excedeu o limite permitido.`
            );
        }
        console.log(`Leitura: $${Leituras[i]}°C - NORMAL`);
    }
}catch (erro) {
    console.log("\nALARME:");
    console.log(erro.message);
}