class Cliente { constructor(nome) { this.nome = nome; } }
class Item { constructor(nome, preco) { this.nome = nome; this.preco = preco; } }
class Pedido {
  constructor(cliente) { this.cliente = cliente; this.itens = []; }
  adicionarItem(nome, preco) { this.itens.push(new Item(nome, preco)); }
}

class CafeteriaService {
  finalizar(pedido) {
    let total = 0;
    for (let i of pedido.itens) { total += i.preco; }
    console.log(`Pedido de ${pedido.cliente.nome}. Total: R$ ${total}`);
  }
}

const clienteSofia = new Cliente("Sofia");
const pedidoSofia = new Pedido(clienteSofia);
pedidoSofia.adicionarItem("Café Expresso", 8.50);

const servicoBackend = new CafeteriaService();
servicoBackend.finalizar(pedidoSofia);