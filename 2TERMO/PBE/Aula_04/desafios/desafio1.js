// Desafio 1

// Desafio 1: O Verificador de Aposentadoria (Lógica e Decisão)
// Objetivo: Praticar cálculos, if/else e operadores lógicos.
// Enunciado: Crie um programa que peça o nome, a idade e o
// tempo de contribuição de um trabalhador. A regra para se
// aposentar é:
// - Ter pelo menos 65 anos de idade.
// - OU ter pelo menos 30 anos de contribuição. Exiba uma
// mensagem dizendo se o trabalhador já pode se aposentar ou
// não.


const entrada = require("readline-sync");

console.log("=== VERIFICADOR DE APOSENTADORIA ===");
const idade = entrada.questionInt("Digite a sua idade: ");
const tempo_contribuicao = entrada.questionInt("Digite quanto tempo de contribuicao em anos voce possui: ");

if (idade >= 65 || tempo_contribuicao >= 30) {
    console.log(`Voce ja pode aposentar!`)
} else{
    console.log(`Voce ainda nao pode aposentar`)
}



