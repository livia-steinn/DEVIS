// 1.  Primeiro, importem a biblioteca readline-sync para podermos conversar com o terminal.
// 2.  Depois, usem o require para buscar as ferramentas que nós acabamos de criar no arquivo anterior. Lembrem-se do ./ para o Node não se perder!
// 3.  Eu quero que o programa pergunte ao usuário:
//       - O nome do produto;
//       - A distância da entrega em KM;
//       - E o valor total da carga.
// 4.  Agora, chamem as funções do nosso módulo para calcular o frete base, o seguro e descobrir o prazo.
// 5.  Por fim, somem o frete com o seguro e imprimam na tela um Relatório de Postagem bem organizado, usando as Template Strings que nós já praticamos.

const entrada = require('readline-sync');
const logistica = require('./calculadoraFrete.js');

console.log("===SISTEMA DE LOGISTICA DE ENTREGA===");

const produto = entrada.question("Nome do produto: ");
const distanciaKm = entrada.questionFloat("Distancia da entrega (km): ")
const valorCarga = entrada.questionFloat("Valor total da carga: ")

const base = logistica.calcularBase(distanciaKm);
const seguro = logistica.calcularSeguro(valorCarga);
const prazo = logistica.verificarPrazo(distanciaKm);

const totalEntrega = base + seguro;

console.log(`\n=== RELATORIO DE POSTAGEM ===`);
console.log(`Produto: ${produto}`);
console.log(`Distancia da entrega: ${distanciaKm} km`);
console.log(`Valor total da carga: R$ ${valorCarga.toFixed(2)}`);
console.log(`Frete: R$ ${base.toFixed(2)}`);
console.log(`Seguro: R$ ${seguro.toFixed(2)}`);
console.log(`Prazo de entrega: ${prazo}`);
console.log(`Total da entrega: R$ ${totalEntrega.toFixed(2)}`);



