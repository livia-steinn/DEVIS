// Objetivo: Combinar repetição, entrada de dados e acumulador.
// Durante um teste de processo, são realizadas cinco medições. Crie um programa que leia as cinco medições e calcule a média.
// O programa deve:
// ☐ Criar uma variável acumuladora iniciada em zero.
// ☐ Usar um laço para solicitar exatamente 5 valores.
// ☐ Somar cada valor ao acumulador.
// ☐ Ao final, calcular a média.
// ☐ Exibir a soma das medições e a média final.


entrada = require("readline-sync");
console.log(`----- MEDICOES -----`);

let soma = 0;

for (let i = 1; i <= 5; i++){
    let valor = entrada.questionFloat(`Digite o valor ${i} : `)
    soma += valor;
}
console.log(`A soma dos valores é ${soma}`);
console.log(`A media final desses valores é ${(soma)/ 5}`);
