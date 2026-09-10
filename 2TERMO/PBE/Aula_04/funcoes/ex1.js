// // criando a "maquina" de calcular media
// function calcularMedia(n1,n2) {
//     return(n1 + n2) / 2;
// }
// //usando a maquina
// const resultado = calcularMedia(10,8);
// const resultado1 = calcularMedia(25,45);
// console.log(`A media calculada foi: ${resultado}`);
// console.log(`A segunda media calculada foi: ${resultado1}`);

///////////////////////////////////////////////////////////////////

const entrada = require("readline-sync");

const n1 = entrada.questionFloat("Digite o primeiro valor: ");
const n2 = entrada.questionFloat("Digite o segundo valor: ");

function calcularMedia(n1,n2) {
    return(n1 + n2) / 2;
}
const resultado = calcularMedia(n1,n2);

console.log(`A media calculada foi: ${resultado}`);


