// ☐ Exibir produção prevista, produção real, percentual e classificação.

entrada = require("readline-sync");
funcao = require("./ex09_eficiencia");

const real = entrada.questionFloat("Digite o valor da producao real: "); 
const prevista = entrada.questionFloat("Digite o valor da producao prevista: "); 

const porcentagem = funcao.calcularEficiencia(real, prevista);
const classe = funcao.classificarEficiencia(percentual);


console.log(`Produção prevista: ${prevista}`);
console.log(`Produção real: ${real}`);
console.log(`Percentual: ${porcentagem.toFixed(2)}%`);
console.log(`Classificação: ${classe}`);