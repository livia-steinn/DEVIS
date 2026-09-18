-- Geracao de Modelo fisico
-- Sql ANSI 2003 - brModelo.

CREATE DATABASE SmartCoffee_Livia;
use SmartCoffee_Livia;

CREATE TABLE Clientes (
ID_cliente int auto_increment primary key,
Nome varchar(100) not null,
CPF varchar(11) unique not null,
data_nascimento date,
Telefone varchar(20),
Email varchar(100),
data_cadastro timestamp default current_timestamp
);

CREATE TABLE Fidelidade (
ID_fidelidade int auto_increment primary key,
saldo_pontos int ,
data_ultima_atualizacao date,
nivel_cliente varchar(15),
status_cartao varchar(15),
quantidade_pedidos int default 0
);

CREATE TABLE realiza (
ID_cliente int ,
ID_fidelidade int ,
ID_pedido int ,
ID_realiza int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(ID_cliente) REFERENCES Clientes (ID_cliente),
FOREIGN KEY(ID_fidelidade) REFERENCES Fidelidade (ID_fidelidade),
FOREIGN KEY(ID_pedido) REFERENCES Pedido (ID_pedido)
);

CREATE TABLE atende (
ID_pedido int ,
ID_pagamento int,
ID_funcionario int ,
ID_atende int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(ID_pedido) REFERENCES Pedido (ID_pedido),
FOREIGN KEY(ID_pagamento) REFERENCES Pagamento (ID_pagamento),
FOREIGN KEY(ID_funcionario) REFERENCES Funcionarios (ID_funcionario)
);

CREATE TABLE Funcionarios (
ID_funcionario int auto_increment primary key PRIMARY KEY,
nome varchar(80) not null,
data_adimissao date,
cargo varchar(50),
salario decimal(10,2),
cpf_funcionario varchar(11) unique not null
);

CREATE TABLE Pedido (
ID_pedido int auto_increment primary key,
local_consumo varchar(20),
tipo_pedido varchar(20),
valor_total decimal(10,2),
data_hora timestamp default current_timestamp,
status_pedido varchar(40)
);

CREATE TABLE Pagamento (
ID_pagamento int auto_increment primary key,
data_hora_pagamento timestamp default current_timestamp,
forma_de_pagamento varchar(30),
status_pagamento varchar(15),
valor_pago decimal(10,2)
);

CREATE TABLE Entrega (
ID_delivery int ,
ID_funcionario int ,
ID_entrega int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(ID_funcionario) REFERENCES Funcionarios (ID_funcionario),
FOREIGN KEY(ID_delivery) REFERENCES Delivery (ID_delivery)
);

CREATE TABLE Produtos (
ID_produto int auto_increment primary key PRIMARY KEY,
vencimento date,
preco_unitario decimal(10,2),
categoria varchar(50),
nome_produto varchar(80),
quantidade int,
descricao varchar(100),
ID_categoria int 
);

CREATE TABLE Categorias (
ID_categoria int auto_increment primary key PRIMARY KEY,
setor_preparo varchar(20),
descricao text,
tipo_produto varchar(50),
nome_categoria varchar(50) not null,
estilo_produto varchar(50)
);

CREATE TABLE contem (
ID_produto int ,
ID_pedido int ,
ID_contem int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(ID_produto) REFERENCES Produtos (ID_produto),
FOREIGN KEY(ID_pedido) REFERENCES Pedido (ID_pedido)
);

CREATE TABLE consome (
ID_estoque int ,
ID_produto int ,
ID_consome int auto_increment primary key PRIMARY KEY,
FOREIGN KEY(ID_produto) REFERENCES Produtos (ID_produto),
FOREIGN KEY(ID_estoque) REFERENCES Estoque (ID_estoque)
);

CREATE TABLE Estoque (
ID_estoque int auto_increment primary key PRIMARY KEY,
unidade_medida varchar(4),
status_estoque varchar(30),
quantidade_atual decimal(10,2),
data_ultima_reposicao timestamp,
estoque_minimo decimal(10,2),
nome_insumo varchar(60)
);

CREATE TABLE Fornecedor (
email varchar(100),
CNPJ varchar(14) unique not null,
ID_fornecedor int auto_increment primary key PRIMARY KEY,
telefone varchar(20),
nome_empresa varchar(100) not null,
cidade varchar(30),
ID_estoque int ,
FOREIGN KEY(ID_estoque) REFERENCES Estoque (ID_estoque)
);

CREATE TABLE Delivery (
ID_delivery int auto_increment primary key PRIMARY KEY,
endereco_entrega varchar(255) not null,
status_entrega varchar(30),
taxa_valor decimal(2,2),
data_hora_saida timestamp default current_timestamp,
valor_compra decimal(10,2),
forma_de_pagamento varchar(15),
ID_pedido int ,
ID_pagamento int ,
FOREIGN KEY(ID_pedido) REFERENCES Pedido (ID_pedido),
FOREIGN KEY(ID_pagamento) REFERENCES Pagamento (ID_pagamento)
);

ALTER TABLE realiza ADD FOREIGN KEY(ID_pedido) REFERENCES Pedido (ID_pedido); 
ALTER TABLE atende ADD FOREIGN KEY(ID_funcionario) REFERENCES Funcionarios (ID_funcionario);
ALTER TABLE Entrega ADD FOREIGN KEY(ID_delivery) REFERENCES Delivery (ID_delivery); 
ALTER TABLE Produtos ADD FOREIGN KEY(ID_categoria) REFERENCES Categorias (ID_categoria);
ALTER TABLE consome ADD FOREIGN KEY(ID_estoque) REFERENCES Estoque (ID_estoque);



