// Objetivo: Utilizar entrada de dados no terminal e operações com valores numéricos.
// Crie um programa para calcular o custo de uma compra de matéria-prima.
// O programa deve:
// ☐ Importar a biblioteca readline-sync.
// ☐ Solicitar ao usuário o nome do material.
// ☐ Solicitar a quantidade comprada.
// ☐ Solicitar o preço unitário.
// ☐ Calcular o valor total da compra.
// ☐ Exibir um pequeno resumo da compra.

entrada = require("readline-sync");
console.log(`----- CALCULO DE MATERIAIS -----`);

const nome = entrada.question("Digite o nome do material: ");
const qtd = entrada.questionInt("Digite a quantidade de materiais comprada: ");
const preco = entrada.questionFloat("Digite o valor unitario desse material: ");

const total = qtd * preco;

console.log(`----- RESULTADO -----`);
console.log(`Material: ${nome}`);
console.log(`Quantidade: ${qtd}`);
console.log(`Preco unitario: ${preco}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);