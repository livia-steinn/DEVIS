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

create table produto (
    id_produto int primary key auto_increment,
    nome varchar(100) not null,
    preco decimal(10,2) not null,
    ativo BOOLEAN not null default true,
    id_categoria int not null,
    constraint fk_produto_categoria foreign key (id_categoria) references categoria(id_categoria)
);

create Table pedido (
    id_pedido int primary key auto_increment,
    data_pedido DATETIME not null,
    status enum('Aberto', 'Preparando', 'Finalizado', 'Cancelado') not null,
    valor_total decimal(10,2) not null default 0.00,
    id_cliente int not null,
    constraint fk_pedido_cliente foreign key (id_cliente) references clientes(id_cliente)
);

create table item_pedido(
    id_item int primary key auto_increment,
    id_pedido int not null,
    id_produto int not null,
    quantidade int not null,
    preco_unitario decimal(10,2) not null,
    observacao varchar(150),
    constraint fk_item_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_item_produto foreign key (id_produto) references produto(id_produto)
);

create table forma_pagamento(
    id_forma_pagamento int primary key auto_increment,
    descricao varchar(40) not null unique
);

create table pagamento(
    id_pagamento int primary key auto_increment,
    id_pedido int not null,
    id_forma_pagamento int not null,
    valor decimal(10,2) not null,
    data_pagamento datetime not null,
    constraint fk_pagamento_pedido foreign key (id_pedido) references pedido(id_pedido),
    constraint fk_pagamento_forma foreign key (id_forma_pagamento) references forma_pagamento(id_forma_pagamento)
);




-- inserindo dados no banco de dados
insert into clientes (nome, email, telefone, cidade, ativo) values 
('Arthur Nunes', 'arthur@email.com', 19999999901, 'Americana', true),
 ('Beatriz Raissa', 'beatriz@email.com', 19999999902, 'Campinas', true),
('Dandara Dias', 'dandara@email.com', 19999999903, 'Piracicaba', true),
('Davi Ferreira', 'davi@email.com', null, 'Limeira', true),
('Felipe Rodrigues', 'felipe@email.com', 19999999905, 'Rio Claro', true),
('Francisco Magri', 'francisco@email.com', 19999999906, 'Sorocaba', true),
('Franz Kramer', 'franz@email.com', 19999999907, 'Jundiaí', true),
('Gabriel Nogueira', 'gabriel@email.com', 19999999908, 'São Paulo', true),
('Gabrielli Araujo', 'gabrielli@email.com', 19999999909, 'Campinas', true),
('Isabella Alves', 'isabella@email.com', 19999999910, 'Dracena', true),
('Keynan Santos', 'keynan@email.com', 19999999911, 'Rio Claro', true),
('Larissa Ramires', 'larissa@email.com', 19999999912, 'Cordeirópolis', true),
('Leonardo Dias', 'leonardo@email.com', 19999999913, 'Mogi Mirim', true),
('Luana Lima', 'luana@email.com', 19999999914, 'Engenheiro Coelho', true),
('Luccas Manfredi', 'luccas@email.com', 19999999915, 'Piracicaba', true),
('Lívia Stein', 'livia@email.com', 19999999916, 'Limeira', true);

insert into categoria (nome) values 
('Cafés'), ('Bebidas Quentes'), ('Bebidas Geladas'), ('Salgados'),  ('Sobremesas'), ('Combos');

-- verificar ultimo insert realizado
insert into categoria (nome) values 
('Doces');

insert into produto(nome,preco, ativo, id_categoria ) VALUES
('Café Expresso', 8.50, true, 1),
('Chocolate Quente', 12.30, true, 2),
('Café com Leite Gelado', 15.90, true, 3),
('Pão com Ovo', 18.00, true, 4),
('Torta de Limão', 14.00, true, 5),
('Salgado + Suco Natural', 23.00,true, 6),
('Sorvete', 7.00, true, 7);

insert into pedido (data_pedido, status, valor_total, id_cliente) VALUES
(NOW(), 'Aberto', 45.58, 1),
(NOW(), 'Aberto', 17.50, 2),
(NOW(), 'Aberto', 64.85, 3),
(NOW(), 'Preparando', 37.19, 4),
(NOW(), 'Preparando', 23.59, 5),
(NOW(), 'Preparando', 84.25, 6),
(NOW(), 'Preparando', 8.90, 7),
(NOW(), 'Cancelado', 34.82, 8),
(NOW(), 'Finalizado', 18.53, 9),
(NOW(), 'Finalizado', 92.80, 10),
(NOW(), 'Cancelado', 28.30, 11),
(NOW(), 'Finalizado', 10.42, 12),
(NOW(), 'Finalizado', 73.18, 13),
(NOW(), 'Finalizado', 52.56, 14),
(NOW(), 'Finalizado', 05.45, 15),
(NOW(), 'Finalizado', 83.19, 16);

insert into item_pedido (id_produto, id_pedido, quantidade, preco_unitario, observacao)values
(1, 1, 2, 8.50, 'Sem açúcar'),
(2, 2, 1, 12.30, 'Com chantilly'),
(3, 3, 3, 15.90, 'Sem gelo'),
(4, 4, 1, 18.00, 'Com queijo extra'),
(5, 5, 2, 14.00, 'Sem limão'),
(6, 6, 1, 23.00, 'Sem acúcar no suco'),
(7, 7, 4, 7.00, 'Com cobertura de chocolate'),
(1, 8, 2, 8.50, 'Mais forte'),
(2, 9, 1, 12.30, 'Com marshmallow'),
(3, 10, 3, 15.90, 'Sem açúcar'),
(4, 11, 1, 18.00, 'Com requeijão extra'),
(5, 12, 2, 14.00, 'Adicionar chocolate'),
(6, 13, 1, 23.00, 'Suco sem gelo'),
(7, 14, 4, 7.00, 'Com confete'),
(1, 15, 2, 8.50, 'Com adocante'),
(2, 16, 1, 12.30, 'Com raspas de chocolate');


insert into forma_pagamento (descricao) values
('Dinheiro'),
('Cartão de Crédito'),
('Cartão de Débito'),
('Pix');

insert into pagamento(id_forma_pagamento, id_pedido, valor, data_pagamento) values
(1, 1, 45.58, NOW()),
(2, 2, 17.50, NOW()),
(3, 3, 64.85, NOW()),
(4, 4, 37.19, NOW()),
(1, 5, 23.59, NOW()),
(2, 6, 84.25, NOW()),
(3, 7, 8.90, NOW()),
(4, 8, 34.82, NOW()),
(1, 9, 18.53, NOW()),
(2, 10, 92.80, NOW()),
(3, 11, 28.30, NOW()),
(4, 12, 10.42, NOW()),
(1, 13, 73.18, NOW()),
(2, 14, 52.56, NOW()),
(3, 15, 05.45, NOW()),
(4, 16, 83.19, NOW());


-- ver dados da tabela
select * from categoria;
select * from clientes;
select * from forma_pagamento;
select * from item_pedido;
select * from pagamento;
select * from pedido;
select * from produto;
-- -----------------------------

-- ATRIBUIR NOMES AOS IDS

insert into categoria(nome) VALUES
('Combos Extras');

set @categorias_novas = (select nome from categoria where nome = 'Combos Extras');

select @categorias_novas;


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

-- consultar dados especificos no banco de dados
select * from clientes
where id_cliente = 4;



---------------------------------------------------
-- Procedimento de uma Compra
-- PASSO 1 : REALIZAR CADASTRO DO CLIENTE
insert into clientes (nome, email, telefone, cidade, ativo) values
('Bruna Rodrigues', 'bruna.rodrigues@email.com', '19999999999', 'São Paulo', true);

set @cliente_compra = LAST_INSERT_ID();

-- PASSO 2 : REALIZAR O PEDIDO

insert into pedido (data_pedido, status, valor_total, id_cliente) values
(NOW(), 'Aberto', 0.00, @cliente_compra);

set @pedido_compra = LAST_INSERT_ID();

-- PASSO 3 : INSERINDO OS ITENS DO PEDIDO

insert into item_pedido (id_produto, id_pedido, quantidade, preco_unitario) values
(1, @pedido_compra, 2, 8.50),
(2, @pedido_compra, 1, 12.30);

-- PASSO 4 : ATUALIZANDO TOTAL E STATUS

update pedido
set valor_total = 22.00,
    status = 'Preparando'
where id_pedido = @pedido_compra;

-- PASSO 5 : REGISTRANDO PAGAMENTO

insert into pagamento (id_forma_pagamento, id_pedido, valor, data_pagamento) values
(2, @pedido_compra, 22.00, NOW());

--- PASSO 6 : CONSULTAR PEDIDO E RESULTADO

select p.id_pedido,
       c.nome AS Nome_Cliente,
       p.status AS Status_Pedido,
       p.valor_total AS Compra_Total
FROM pedido p
JOIN cliente c ON c.id_cliente = p.id_cliente
WHERE p.id_pedido = @pedido_compra;

-- PASSO 7: RELATORIO
--PASSO 1 
select nome FROM cliente WHERE id_cliente = @cliente_compra;

select nome FROM cliente WHERE id_cliente = 121;

--PASSO 2
select * from pedido Where id_pedido = @pedido_compra;



-------------------------------
-- TRANSAÇÕES - SEGURANÇA PARA DML

START TRANSACTION;

UPDATE produto
SET preco = preco * 2.80
WHERE id_categoria = 1;

SELECT id_produto, nome, preco
FROM produto
WHERE id_categoria = 1;

-- DESFAZ O QUE FIZEMOS ERRADO OU VOLTA UMA TRANSAÇÃO

ROLLBACK;

-- VALIDA O PROCEDIMENTO DE TRANSAÇÃO

COMMIT;

START TRANSACTION;

UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;

SELECT * FROM cliente WHERE id_cliente = 121;

COMMIT;

ROLLBACK;