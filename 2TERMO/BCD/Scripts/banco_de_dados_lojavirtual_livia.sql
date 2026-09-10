-- comando para criar um banco de dados  (para fazer uma linha funcionar clicar em "Ctrl + Enter")
create database loja_livia;
create database loja_livia2; 

-- comando para apagar um banco de dados
drop database loja_livia2;
 
 -- coamndo para ativar o banco de dados
 use loja_livia;
 
create table clientes (
 id_cliente int auto_increment primary key,
 nome varchar(100) not null unique,
 data_nascimento date not null,
 endereco varchar(250) not null,
 cpf char(11) not null unique,
 telefone varchar(15) not null,
 email varchar(100) not null unique
 );
 
create table pedidos (
 id_pedido int auto_increment primary key,
 data_pedido timestamp default current_timestamp,
 valor_total decimal(10,2) not null,
 status_do_pedido varchar(30) not null,
 quantidade_total_produtos int not null,
 resumo_geral varchar(250)
 );
 
create table produtos (
 id_produtos int auto_increment primary key,
 nome_produtos varchar(100) not null,
 fornecedor varchar(60) not null,
 categoria varchar(50) not null,
 preco_unitario decimal(10,2) not null, 
 tamanho varchar(3) not null
 );
 
create table estoque (
 id_estoque int auto_increment primary key,
 quantidade_produtos int not null,
 status_estoque varchar(30) not null,
 estoque_minimo int not null,
 local_lote varchar(50) not null,
 data_ultima_entrada datetime
 );
 
create table entrega (
 id_entrega int auto_increment primary key,
 valor_frete decimal(10,2) not null,
 observacao_endereco varchar(250) not null,
 status_entrega varchar (30) not null,
 codigo_rastreio varchar(10) unique,
 data_entrega datetime,
 transportadora varchar(30)
 );
 
create table pagamento(
 id_pagamento int auto_increment primary key,
 forma_pagamento varchar(20) default "credito" not null, 
 data_efetuacao datetime,
 valor_pago decimal (10,2) not null,
status_do_pagamento varchar(20) not null
 );
 
 
