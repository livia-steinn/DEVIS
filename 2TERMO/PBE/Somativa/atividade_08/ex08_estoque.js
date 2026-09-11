// Objetivo: Combinar objetos, arrays, repetição e condição em um único programa.
// Crie um programa para cadastrar três componentes do estoque. Cada componente deverá possuir nome, quantidade e estoque mínimo. Ao final, o programa deverá apresentar todos os componentes e informar quais precisam de reposição.
// O programa deve:
// ☐ Criar um array vazio para armazenar os componentes.
// ☐ Cadastrar 3 componentes usando um laço.
// ☐ Para cada componente, criar um objeto com nome, quantidade e estoqueMinimo.
// ☐ Adicionar cada objeto ao array com push().
// ☐ Percorrer o array com um laço.
// ☐ Se quantidade for menor que estoqueMinimo, exibir 'REPOR ESTOQUE'.
// ☐ Caso contrário, exibir 'ESTOQUE OK'.

entrada = require("readline-sync");
console.log(`----- CADASTRO DE ITENS PARA O ESTOQUE -----`);

const componentes = [];

let estoqueMinimo = 10;

for (let i = 0; i < 3; i++){
    const nome = entrada.question(`Digite o nome do componente ${i+1}: `);
    const quantidade = entrada.questionInt(`Digite a quantidade do componente ${i+1}: `);
    
    const componente = {
        nome: nome,
        quantidade: quantidade,
        estoqueMinimo: estoqueMinimo
    };
    componentes.push(componente);
}
for (let i = 0; i < componentes.length; i++){
    if(componentes[i].quantidade < componentes[i].estoqueMinimo){
    console.log(` - Componente ${componentes[i].nome} possui ${componentes[i].quantidade} unidades no estoque - REPOR ESTOQUE`)
} else {
    console.log(` - Componente ${componentes[i].nome} possui ${componentes[i].quantidade} unidades no estoque - ESTOQUE OK`)
}
}