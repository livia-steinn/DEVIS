// Uma linha de produção fabrica uma determinada quantidade de peças por hora. Crie um programa que calcule quantas peças serão produzidas em um turno.
// O programa deve:
// ☐ Criar uma variável com a quantidade de peças produzidas por hora.
// ☐ Criar uma variável com a quantidade de horas do turno.
// ☐ Calcular a produção total do turno.
// ☐ Exibir uma frase informando a produção por hora, as horas e o total produzido.

console.log("--- LINHA DE PRODUÇÃO --- ")

let pecasHora = 120; 
let horasTurno = 8; 

let totalTurno = pecasHora * horasTurno ; 

console.log (`Em ${horasTurno} horas de trabalho são produzidas ${pecasHora} pecas. No total foram produzidas ${totalTurno} pecas durante esse turno!`)