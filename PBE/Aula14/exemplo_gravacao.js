const fs = require('fs');

console.log("=== SISTEMA DE REGISTRO DE MÁQUINAS ===")

const maquinasindustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Usinagem", operacional: true},
    {id: 102, nome: "Fresadora", setor: "Usinagem", operacional: false},
    {id: 103, nome: "Prensa Hidráulica", setor: "Escamparia", operacional: true}
]
fs.writeFileSync('maquinas_industriais.json', JSON.stringify(maquinasindustriais, null, 2));

console.log(`\ Gravacao concluida com sucesso, verifique o arquivo gravado na pasta.`);