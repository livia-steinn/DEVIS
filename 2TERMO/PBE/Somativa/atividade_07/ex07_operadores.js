// Objetivo: Cadastrar e percorrer dados armazenados em um array.
// Crie um programa para cadastrar os nomes de cinco operadores de uma equipe e, ao final, listar todos os nomes numerados.
// O programa deve:
// ☐ Criar um array vazio.
// ☐ Usar um laço para solicitar 5 nomes.
// ☐ Adicionar cada nome ao array usando push().
// ☐ Depois do cadastro, percorrer o array novamente.
// ☐ Exibir no formato: '1 - Nome', '2 - Nome' etc.
// ☐ Utilizar a propriedade length em pelo menos um dos laços.

entrada = require("readline-sync");
console.log(`----- CADASTRO DE OPERADORES -----`);

const operadores = [];

for (let i = 0; i < 5; i++){
    const nome = entrada.question(`Digite o nome do operador ${i+1}: `);
    operadores.push(nome);
}
console.log(`----- LISTA DE OPERADORES -----`);
for (let i = 0; i < operadores.length; i++){
    console.log(`${i+1} - Nome: ${operadores[i]}`);
}