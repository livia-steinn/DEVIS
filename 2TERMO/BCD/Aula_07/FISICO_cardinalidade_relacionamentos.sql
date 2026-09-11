-- Active: 1788519247415@@127.0.0.1@3306@sesi_ce_ta
-- Gera��o de Modelo f�sico
-- Sql ANSI 2003 - brModelo.
-- Relacionamentos e Cardinalidade - Banco de dados Exemplo

create database if not exists SESI_CE_TA;

use SESI_CE_TA;

CREATE TABLE Cliente (
nome_cliente varchar(60),
Id_cliente int auto_increment primary key PRIMARY KEY
);

CREATE TABLE Pedido (
data_pedido datetime,
id_pedido int auto_increment primary key PRIMARY KEY,
Id_cliente int not null,
FOREIGN KEY(Id_cliente) REFERENCES Cliente (Id_cliente)
);
CREATE TABLE Estoque (
id_produto int not null unique,
nome_produto varchar(30),
id_estoque int auto_increment primary key,
quantidade decimal(10,2)
-- PRIMARY KEY(id_produto,id_estoque)
);

CREATE TABLE Fornecedor (
id_fornecedor int auto_increment primary key PRIMARY KEY,
razao_social varchar(40)
)

CREATE TABLE Produto (
id_produto int auto_increment primary key PRIMARY KEY,
nome_produto varchar(30)
)


CREATE TABLE Item_produto1 (
valor decimal(5,2),
Id_item int auto_increment primary key PRIMARY KEY,
id_produto int not null,
id_fornecedor int not null,
Observacao text(300),
FOREIGN KEY(id_produto) REFERENCES Produto (id_produto),
FOREIGN KEY(id_fornecedor) REFERENCES Fornecedor (id_fornecedor)
)



