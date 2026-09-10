const caixa = require("./calculosVenda")

entrada = require("readline-sync")

preco = entrada.questionFloat("Digite o preco do produto: ")
qtd = entrada.questionInt("Digite a quantidade: ")
nome = entrada.question("Digite o nome do cliente: ")

total = caixa.calcularTotal(preco, qtd)

console.log(`----------------------------------------------`)
console.log(`============== CUPOM FISCAL ==============`)
console.log(`~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`)
console.log(caixa.gerarCupom(nome, total))
console.log(`----------------------------------------------`)