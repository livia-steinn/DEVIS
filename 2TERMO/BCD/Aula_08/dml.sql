-- Active: 1788519247415@@127.0.0.1@3306@smartcoffee_dml_livia

drop database if exists smartcoffee_dml_livia;

create database if not exists smartcoffee_dml_livia;

use smartcoffee_dml_livia;

create table clientes (
id_cliente int auto_increment primary key,
nome varchar(100) not null,
email varchar(120) UNIQUE,
telefone varchar(15),
cidade varchar(60) not null,
ativo boolean not null default true
);

create table categoria(
    id_categoria int primary key auto_increment,
    nome varchar(60) not null unique
);

-- inserindo dados no banco de dados
insert into clientes (nome, email, telefone, cidade, ativo) values ('Arthur Nunes', 'arthur@email.com', 19999999901, 'Rondonia', true), ('Beatriz Raissa', 'beatriz@email.com', 19999999902, 'Limeira', true),
('Dandara Dias', 'dandara@email.com', 19999999903, 'Limeira', true),
('Davi Ferreira', 'davi@email.com', null, 'Limeira', true),
('Felipe Rodrigues', 'felipe@email.com', 19999999905, 'Limeira', true),
('Francisco Magri', 'francisco@email.com', 19999999906, 'Limeira', true),
('Franz Kramer', 'franz@email.com', 19999999907, 'Limeira', true),
('Gabriel Nogueira', 'gabriel@email.com', 19999999908, 'Limeira', true),
('Gabrielli Araujo', 'gabrielli@email.com', 19999999909, 'Limeira', true),
('Isabella Alves', 'isabella@email.com', 19999999910, 'Limeira', true),
('Keynan Santos', 'keynan@email.com', 19999999911, 'Limeira', true),
('Larissa Ramires', 'larissa@email.com', 19999999912, 'Limeira', true),
('Leonardo Dias', 'leonardo@email.com', 19999999913, 'Limeira', true),
('Luana Lima', 'luana@email.com', 19999999914, 'Limeira', true),
('Luccas Manfredi', 'luccas@email.com', 19999999915, 'Limeira', true),
('Lívia Stein', 'livia@email.com', 19999999916, 'Limeira', true);

insert into categoria (nome) values 
('Cafés'), ('Bebidas Quentes'), ('Bebidas Geladas'), ('Salgados'),  ('Sobremesas'), ('Combos');

-- verificar ultimo insert realizado
insert into categoria (nome) values 
('Doces');

set @categoria = LAST_INSERT_ID();

select @categoria;
-- -----------------------------

-- atulizando ou modificando dados no bd
-- lembrar de sempre executar o select para atualizar
-- e nao fazer update sem where

-- ex1: modificando valores individuais
update clientes
set telefone = '19999999904'
where id_cliente = 4;

update clientes -- muda o numero de todos
set telefone = '00000000000';


-- ex2: modificando varios valores

update clientes
SET telefone = '19994935449',
    cidade = 'São Paulo'
Where id_cliente = 16

-- apagar dados da tabela no bd
delete from clientes
where id_cliente = 16;

-- consultar dados no banco de dados]

select * from clientes;
where id_cliente = 4;
select * from categoria;