// 1.  calcularBase(km): Ela deve receber a distância e me retornar o valor do frete, cobrando R$ 2,10 por cada quilômetro rodado.
// 2.  calcularSeguro(valorCarga): O seguro da nossa transportadora é de 1% sobre o valor da carga. Criem essa lógica aqui dentro.
// 3.  verificarPrazo(km): Aqui eu quero uma decisão. Se a distância for menor que 100km, a função deve me retornar o texto: '1 dia útil'. Caso contrário, deve retornar: '3 a 5 dias úteis'.

// Atenção: No final desse arquivo, não esqueçam de usar o module.exports para que eu possa usar essas ferramentas em outro lugar!"

function calcularBase(km) {
    return km * 2.10;
}

function calcularSeguro(valorCarga) {
    return valorCarga * 1.01;
}

function verificarPrazo(km) {
    if (km <= 100){
    return '1 dia util';
    } else {
    return '3 a 5 dias úteis';
}
}
module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}
