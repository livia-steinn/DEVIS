const entrada = require("readline-sync");

function converterParaFahrenheit(celsius) {
    let fahrenheit = (celsius * 9/5) + 32;
    return fahrenheit; // devolve o resultao para quem chamou
}

const tempC = entrada.questionFloat("Digite a temperatura em Celsius: ");

//chamando a funcao e guardando o que ela "cuspiu" de volta

const tempF= converterParaFahrenheit(tempC);
console.log(`A temperatura convertida e: ${tempF.toFixed(1)}°F`)