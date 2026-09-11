const fs = require('fs');
const entrada = require('readline-sync');

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===\n");

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const termoBusca = entrada.questionInt("Digite a quantidade do produto para buscar: ");

    const resultado = produtos.filter(p => p.qtd >= termoBusca);
    
    if (resultado) {        
        console.log(resultado)
    } else {
        console.log("\n Sinto muito! Produto não encontrado.");
    }
} catch (error) {
    console.log("Erro ao acessar o banco de dados: " + error.message);
}