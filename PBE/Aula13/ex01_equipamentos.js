const fs = require('fs');

const equipamentos = [
    {codigo: 1, nome: "Torno CNC", setor: "Usinagem", operacional: true},
    {codigo: 2, nome: "Prensa Hidraulica", setor: "Operacoes", operacional: false},
    {codigo: 4, nome: "Betoneira", setor: "Producoes", operacional: true},
];

const textoEquipamentos = JSON.stringify(equipamentos, null, 2);

fs.writeFileSync('equipamentos.json', textoEquipamentos);

console.log('Equipamentos salvos')