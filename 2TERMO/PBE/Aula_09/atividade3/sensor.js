// Atividade 3: Gestor de Clima Industrial (Múltiplas Funções)
// Foco: Exportar um objeto com várias funções.

// "Agora vamos criar um sistema para o setor de segurança. Precisamos de um
// módulo chamado sensor.js que tenha duas ferramentas:"
// 1. checarTemperatura(valor): Se for maior que 40, retorna "ALERTA: Caldeira
// Superaquecida".
// 2. checarUmidade(valor): Se for menor que 20, retorna "ALERTA: Ar muito seco".

// Instrução: No arquivo principal.js, peça os dois valores ao usuário e use as
// ferramentas do módulo para exibir os avisos.

function checarTemperatura(valorT){
    if (valorT > 40)
        return ("ALERTA: Caldeira Superaquecida ")
    else
        return("A Caldeira esta na temperatura ideal")
}

function checarUmidade(valorU) {
    if (valorU < 20)
        return ("ALERTA: Ar muito seco")
    else
        return("O ar esta na umidade ideal")
}

module.exports = {
    checarTemperatura,
    checarUmidade
};