// Objetivo: Aplicar uma estrutura condicional simples.
// Uma peça será aprovada no controle de qualidade quando seu peso estiver entre 95 g e 105 g, inclusive. Crie um programa que leia o peso e informe o resultado da inspeção.
// O programa deve:
// ☐ Solicitar o peso da peça.
// ☐ Usar if/else para decidir se a peça está dentro do padrão.
// ☐ Exibir 'PEÇA APROVADA' quando estiver entre 95 e 105 g.
// ☐ Exibir 'PEÇA REPROVADA' nos demais casos.
// ☐ Exibir também o peso informado.


entrada = require("readline-sync");

const pesoPeca = entrada.questionFloat("Digite o peso da peca em gramas: ");

if (pesoPeca >= 95 && pesoPeca <= 105) {
    console.log(`PECA de ${pesoPeca}g APROVADA! `)
}
else {
    console.log(`PECA de ${pesoPeca}g REPROVADA! `)
};