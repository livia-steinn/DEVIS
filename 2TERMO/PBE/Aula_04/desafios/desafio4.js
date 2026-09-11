// Desafio 4

const { question } = require('readline-sync');

// Desafio 4: Catálogo de Filmes (Objetos e Arrays)
// Objetivo: Manipular listas de objetos e acessar suas propriedades.
// Enunciado: Crie um Array de Objetos chamado cinema. Cada
// objeto deve representar
// um filme e ter as propriedades: titulo e classificacao (idade
// mínima).
// Cadastre 3 filmes manualmente no código. Depois, peça a idade
// do usuário no terminal e use um loop para mostrar apenas os
// títulos dos filmes que ele tem idade para assistir.

entrada = require('readline-sync');

console.log("Catalogo de Filmes: ")

const cinema = [
    {titulo: "Gente Grande", classificacao: 12 },
    {titulo: "Frozen", classificacao: 5 },
    {titulo: "Panico", classificacao: 18 },
]

const idade = entrada.questionInt("Digite sua idade: ");

console.log(`Pela sua idade, você pode assistir aos seguintes filmes: `);

for (let i = 0; i < cinema.length; i++) {
    if (idade >= cinema[i].classificacao) {
        console.log(`- ${cinema[i].titulo}`);
    }
}