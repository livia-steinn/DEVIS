// O gerente da fábrica notou que algumas máquinas estão trabalhando demais e precisam de manutenção preventiva. O nosso desafio é criar um sistema que varre o banco de dados e gera uma lista de 'máquinas em perigo'.
// O que vocês devem fazer:
// Crie um arquivo chamado maquinas.json com esta lista inicial:
// code
// JSON
// [
//   { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
//   { "id": 2, "nome": "Fresadora", "horasUso": 800 },
//   { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
//   { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
// ]
// Crie um programa que leia esse arquivo.
// Use o método .filter() para criar uma nova lista apenas com as máquinas que tenham mais de 1000 horas de uso.
// O programa deve exibir os nomes dessas máquinas no terminal e salvar essa lista de alertas em um novo arquivo chamado manutencao_urgente.json."
// Dica do Professor: "Lembrem-se: o .filter() traz TODOS que combinam com a regra, enquanto o .find() traz apenas o primeiro!"


const fs = require('fs');

const maquinas = [
    { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
    { "id": 2, "nome": "Fresadora", "horasUso": 800 },
    { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
    { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
];

function salvarDados() {    
    const dadosTexto = JSON.stringify(maquinas, null, 2);

    fs.writeFileSync('manutencao_urgente.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!")
}
function verHorasUso() {
    console.log("\n --- Máquinas com mais horas de uso (mais de 1000)---");

    const horasUso = maquinas.filter (p => p.horasUso > 1000);
    console.log(horasUso);
}

salvarDados();
verHorasUso();
