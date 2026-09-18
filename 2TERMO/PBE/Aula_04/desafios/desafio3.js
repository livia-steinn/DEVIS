// Desafio 3

// Desafio 3: Calculadora de Área de Terrenos (Funções)
// Objetivo: Criar uma função que recebe parâmetros e
// retorna um valor.
// Enunciado: Crie uma função chamada calcularArea que
// receba a largura e o comprimento de um terreno e retorne
// a área total (largura * comprimento). No programa
// principal, peça os dados de 3 terrenos diferentes ao
// usuário, chame a função para cada um e mostre o
// resultado.

const entrada = require('readline-sync');

function calcularArea (largura,comprimento) {
    return largura * comprimento
}
const largura1 = entrada.questionFloat("Digite a largura do primeiro terreno: ");
const largura2 = entrada.questionFloat("Digite a largura do segundo terreno: ");
const largura3 = entrada.questionFloat("Digite a largura do terceiro terreno: ");

const comprimento1 = entrada.questionFloat("Digite o comprimento do primeiro terreno: ");
const comprimento2 = entrada.questionFloat("Digite o comprimento do segundo terreno: ");
const comprimento3 = entrada.questionFloat("Digite o comprimento do terceiro terreno: ");

const areatotal1 = largura1 * comprimento1
const areatotal2 = largura2 * comprimento2
const areatotal3 = largura3 * comprimento3

console.log(`Area do primeiro terreno ${areatotal1}`);
console.log(`Area do primeiro terreno ${areatotal2}`);
console.log(`Area do primeiro terreno ${areatotal3}`);