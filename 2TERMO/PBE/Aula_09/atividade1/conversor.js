// Atividade 1: A Casa de Câmbio (Fixação de Sintaxe)
// Foco: Exportar e importar uma função simples com o caminho correto.

// 1. Crie uma pasta chamada atividade1. -- feito
// 2. Crie o arquivo conversor.js (Módulo). Dentro dele, crie uma função que
// recebe um valor em Dólar e retorna em Real (considere o dólar a R$ 5,00).
// 3. Exporte essa função.
// 4. Crie o arquivo app.js. Peça o valor em dólar ao usuário, use a ferramenta do
// módulo e mostre o resultado.


function converterDolarParaReal(valorDolar) {
    const valorFixoDolar = 5.00;  
    const valorReal =   valorDolar * valorFixoDolar ;
    return valorReal
}
module.exports = {converterDolarParaReal};