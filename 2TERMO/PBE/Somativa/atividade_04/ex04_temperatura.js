// Objetivo: Trabalhar com if, else if e else em uma regra de negócio.
// Crie um programa que leia a temperatura de uma máquina e classifique sua situação.
// O programa deve:
// ☐ Até 60 °C: situação NORMAL.
// ☐ De 61 °C até 80 °C: situação ATENÇÃO.
// ☐ Acima de 80 °C: situação CRÍTICA.
// ☐ Solicitar a temperatura pelo terminal.
// ☐ Exibir a temperatura e a classificação.

entrada = require("readline-sync");

const temp = entrada.questionFloat("Digite a temperatura da maquina: ");

if (temp<= 60){
    console.log(`Temperatura ${temp} está em situacao NORMAL`)
}
else if (temp> 60 && temp>80) {
    console.log(`Temperatura ${temp} está em situacao de ATENCAO`)
}
else {
    console.log(`Temperatura ${temp} está em situacao CRITICA`)
}