// Atividade 4: O "Mercadinho" (Organização de Responsabilidades)

// "Este é o teste final. Quero um sistema de vendas. Mas atenção à regra
// profissional: O arquivo de funções não pode fazer perguntas! Ele apenas recebe
// números e devolve cálculos."

// - Módulo calculosVenda.js:
// - Função calcularTotal(preco, qtd) -> retorna preco * qtd.
// - Função gerarCupom(nome, valor) -> retorna uma string: "Cliente: [nome] -
// Total: R$ [valor]".

// - Programa caixa.js:
// - Faz todos os question do readline-sync.
// - Usa o módulo para processar e imprime o cupom final.

function calcularTotal(preco, qtd){    
    return preco * qtd
}

function gerarCupom(nome, valor){
    return `Cliente: ${nome} - Total: R$ ${valor}`;
}

module.exports = {
    calcularTotal,
    gerarCupom
};
