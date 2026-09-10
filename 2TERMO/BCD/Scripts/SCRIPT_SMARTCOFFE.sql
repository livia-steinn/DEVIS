-- PROJETO SMARTCOFFE_LIVIA
-- criar banco de dados
-- ativar banco de dados
-- criar tabelas

-- opcionais no dia 21/08
-- inserir dados
-- consultar dados

create database smartcoffe_livia;

use smartcoffe_livia;

create table if not exists clientes (
id_cliente int auto_increment primary key,
nome varchar(60) not null,
cpf varchar(11) unique not null,
data_nascimento date,
telefone varchar(20),
email varchar(100),
data_cadastro timestamp default current_timestamp
);

create table if not exists pedidos (
id_pedido int auto_increment primary key,
local_consumo varchar(20),
observacao_pedido text,
valor decimal(10,2),
data_pedido timestamp default current_timestamp,
status_pedido varchar(40)
);



CREATE TABLE Prog_fidelidade (
    ID_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
    Pontos_acumulados INT,
    data_ultima_pontuacao DATETIME,
    nivel_cliente VARCHAR(50),
    status_cartao VARCHAR(20),
    quantidade_pedidos INT,
    ID_cliente INT UNIQUE NOT NULL
);


CREATE TABLE Funcionarios (
    ID_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    setor VARCHAR(50),
    cargo VARCHAR(50),
    salario DECIMAL(10, 2),
    historico_academico TEXT
);


CREATE TABLE Categorias (
    ID_categoria INT AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(50) NOT NULL,
    tipo_produto VARCHAR(50),
    descricao TEXT,
    estilo_produto VARCHAR(50),
    setor_preparo VARCHAR(50)
);


CREATE TABLE Fornecedor (
    ID_fornecedor INT AUTO_INCREMENT PRIMARY KEY,
    nome_empresa VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    CNPJ VARCHAR(18) UNIQUE,
    email VARCHAR(100),
    cidade VARCHAR(50)
);


CREATE TABLE Estoque (
    ID_estoque INT AUTO_INCREMENT PRIMARY KEY,
    lote_ingrediente VARCHAR(50),
    status_estoque VARCHAR(30),
    quantidade INT,
    data_ultima_reposicao DATETIME,
    estoque_minimo INT DEFAULT 0,
    ID_fornecedor INT NOT NULL
);


CREATE TABLE Produtos (
    ID_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(100) NOT NULL,
    tipo VARCHAR(50),
    quantidade INT ,
    valor_unitario DECIMAL(10, 2) NOT NULL,
    vencimento DATE,
    ID_categoria INT NOT NULL,
    ID_estoque INT NOT NULL
);

CREATE TABLE Pagamento (
    ID_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    valor_total DECIMAL(10, 2) NOT NULL,
    status_pagamento VARCHAR(30),
    forma_de_pagamento VARCHAR(50),
    data_do_pagamento DATETIME DEFAULT CURRENT_TIMESTAMP,
    ID_pedido INT UNIQUE NOT NULL
);


CREATE TABLE Delivery (
    ID_entrega INT AUTO_INCREMENT PRIMARY KEY,
    endereco TEXT NOT NULL,
    status_entrega VARCHAR(30),
    valor_frete DECIMAL(10, 2),
    nome_entregador VARCHAR(100),
    valor_compra DECIMAL(10, 2),
    forma_de_pagamento VARCHAR(50),
    ID_pedido INT UNIQUE NOT NULL,
);


CREATE TABLE Pedido_Produtos (
    ID_pedido INT NOT NULL,
    ID_produto INT NOT NULL,
    quantidade INT DEFAULT 1,
    valor_unitario DECIMAL(10, 2)
);














