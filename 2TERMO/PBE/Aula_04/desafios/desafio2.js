// Desafio 2

// Desafio 2: O Gerador de Parcelas (Laços de Repetição)
// Objetivo: Praticar o uso do laço for e cálculos
// matemáticos.
// Enunciado: Uma loja de ferramentas quer mostrar ao
// cliente o valor das parcelas de uma compra. Peça o valor
// total do produto e a quantidade de parcelas (máximo 12).
// Use um loop para imprimir na tela o valor de cada parcela.
// - Exemplo: "Parcela 1: R 50,00", "Parcela 2: R 50,00"...

const entrada = require("readline-sync"); 

const totalParcelas = [" "]
const valor = entrada.questionInt("Digite o valor do produto: ");
const parcela = entrada.questionInt("Quantas vezes voce deseja parcelar?(max 12x): ");


const conta = valor/parcela;
for (let i = 1; i < parcela; i++){
    console.log(`Parcela ${i}: R$ ${conta.toFixed(2)}`)
}
    