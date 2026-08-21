function verificarPeso(peso) {
    if (peso < 100 || peso > 500) {
        return "Peso fora do padrão! Peça descartada.";
    } else {
        return `Peça aprovada com ${peso}g.`;
    }
}

module.exports = {
    verificarPeso
}