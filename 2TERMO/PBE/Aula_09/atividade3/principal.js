const sensor = require("./sensor");

entrada = require("readline-sync");

const valorT = entrada.questionFloat("Digite o valor da temperatura da Caldeira: ");
const valorU = entrada.questionFloat("Digite o valor da Umidade do Ar: ");

console.log(sensor.checarTemperatura(valorT))
console.log(sensor.checarUmidade(valorU))