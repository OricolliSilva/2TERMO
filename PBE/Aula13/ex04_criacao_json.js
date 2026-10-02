const fs = require('fs');

const sensores = [
  { codigo: 101, tipo: 'Temperatura', valor: 45.5, unidade: '°C', status: 'OK' },
  { codigo: 102, tipo: 'Pressão', valor: 8.5, unidade: 'bar', status: 'Alerta' },
  { codigo: 103, tipo: 'Vibração', valor: 1.2, unidade: 'mm/s', status: 'OK' },
  { codigo: 104, tipo: 'Temperatura', valor: 92.0, unidade: '°C', status: 'Alerta' },
  { codigo: 105, tipo: 'Nível', valor: 88, unidade: '%', status: 'OK' }
];

fs.writeFileSync('monitoramento.json', JSON.stringify(sensores, null, 2));

console.log('Ficheiro monitoramento.json criado com sucesso!');