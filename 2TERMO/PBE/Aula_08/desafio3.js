// agora vamos simular o sistema da portaria. Temos um arquivo de funcionários e precisamos verificar se um ID digitado existe no sistema.
// O que vocês devem fazer:
// Crie um arquivo chamado funcionarios.json com alguns nomes e IDs (ex: { "id": 101, "nome": "Ana", "setor": "Usinagem" }).
// O programa deve pedir para o usuário digitar um ID.
// Use o método .find() para localizar o funcionário com aquele ID.
// Se encontrar: Mostre o nome e o setor dele.
// Se NÃO encontrar: Mostre 'Acesso Negado: ID não encontrado'.
// DESAFIO EXTRA (Nível Pro): Se o funcionário for encontrado, pergunte para qual setor ele vai mudar, atualize o objeto no JavaScript e salve o arquivo JSON com a informação nova."

const fs = require('fs');

const funcionarios = [
    { "id": 101, "nome": "Ana", "setor": "Usinagem" },
];

function salvarDados() {    
    const dadosTexto = JSON.stringify(funcionarios, null, 2);

//     fs.writeFileSync('funcionarios.json', dadosTexto);
//     console.log("Dados salvos com sucesso no arquivo estoque.json!")
// }
// function verIDfuncionario() {
//     console.log("\n --- Máquinas com mais horas de uso (mais de 1000)---");

//     const horasUso = maquinas.filter (p => p.horasUso > 1000);
//     console.log(horasUso);
// }

// salvarDados();
// verIDfuncionario();