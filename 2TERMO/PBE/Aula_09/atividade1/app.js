const conversao = require('./conversor');
entrada = require('readline-sync');

const valorDolar = entrada.questionFloat('Digite o valor em dolar: ');

const valorReal = conversao.converterDolarParaReal(valorDolar)

console.log(`O valor em real é: R$ ${valorReal.toFixed(2)}`);