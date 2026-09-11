// Neste arquivo, vamos criar a função que decide se o peso é
// válido.

// 1.  Crie uma função
// chamada verificarPeso(leitura).

// 2.  Converta a leitura
// para número: const peso = Number(leitura).

// 3.  Se o resultado não
// for um número (isNaN), disparem um erro: 'Entrada inválida! Digite apenas
// números.'

// 4.  Se o peso for
// menor que 100 ou maior que 500, disparem outro erro: 'Peso fora do padrão (100g
// - 500g)! Peça descartada.'

// 5.  Se estiver tudo  
// certo, retornem: 'Peça aprovada com [peso]g.'

// Não esqueçam de exportar a função no final!"


function verificarPeso(leitura) {
        const peso = Number(leitura);
}

try {
    console.log("\n=== BALANCA DE PRECISAO INDUSTRIAL ===");

    if (isNaN(peso)) {
    throw new Error("Entrada inválida! Digite apenas números.");
    }

    if (peso<100 || peso>500) {
    throw new Error("Peso fora do padrão (100g - 500g)! Peça descartada.");
    }
    console.log(`\nPeça aprovada com ${peso}g. `);

    module.exports = verificarPeso;

}
