
// Neste arquivo, vamos criar o loop que mantém o sistema ligado.
// 1.  Importem o readline-sync e o seu módulo de funções.
// 2.  Criem um laço de repetição while (true).
// 3.  Dentro do loop, usem o bloco try...catch.
// 4.  No try:
// - Peçam para o usuário digitar o peso (ou 'sair').
// - Chamem a função verificarPeso e mostrem o resultado.
// 5.  No catch:
// - Capturem o erro e mostrem a mensagem: '⚠️ ALERTA: [mensagem do erro]'.





entrada = require('readline-sync');
peso = require('./funcoesBalanca');

let sistemaAtivo = true;

while (sistemaAtivo) {
    try{
        console.log("\n=== BALANCA DE PRECISAO INDUSTRIAL ===");
        const verificarPeso = entrada.question("Digite o peso (em kg): ");
    if (verificarPeso.toLowerCase() === 'sair') break;
    } catch (erro) {
    console.log(`\n⚠️  ALERTA: ${erro.message}`);
}
}
