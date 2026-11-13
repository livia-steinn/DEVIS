-- Active: 1794484916109@@127.0.0.1@3306@recuperativa_retrogame_livia
drop DATABASE recuperativa_retrogame_livia;


-- Fase 1 - DDL: estrutura e restrições (25 pontos)

-- 1. Criar e selecionar o banco
create database if not exists recuperativa_retrogame_livia;
use recuperativa_retrogame_livia;

-- 2. Tabela CLIENTE
create table if not exists cliente (
    id_cliente int AUTO_INCREMENT,
    nome varchar (100) not null,
    email varchar(120) not null unique,
    telefone varchar(20) null,
    ativo BOOLEAN default true,
    constraint PK_cliente PRIMARY KEY (id_cliente),
    constraint uq_email UNIQUE (email)
);

-- 3. PLATAFORMA e CATEGORIA
create table if not exists plataforma (
    id_plataforma int AUTO_INCREMENT,
    nome varchar(80) not null unique,
    constraint PK_plataforma PRIMARY KEY (id_plataforma)
);

create table if not exists categoria (
    id_categoria int AUTO_INCREMENT,
    descricao varchar(80) not null unique,
    constraint PK_categoria PRIMARY KEY (id_categoria)
);

-- 4. Tabela JOGO

create table if not exists jogo (
    id_jogo int AUTO_INCREMENT,
    titulo varchar(150) not null,
    codigo varchar(15) not null unique,
    ano_lancamento int not null,
    quantidade_disponivel int default 0 check(quantidade_disponivel>= 0),
    id_categoria int not null,
    id_plataforma int not null,
    constraint PK_jogo PRIMARY KEY (id_jogo),
    constraint fk_categoria_jogo FOREIGN key (id_categoria)
    references categoria(id_categoria),
    constraint fk_plataforma_jogo FOREIGN key (id_plataforma)
    references plataforma(id_plataforma)
);


-- 5. Tabela LOCACAO
create table if not exists locacao (
    id_locacao int AUTO_INCREMENT,
    data_retirada datetime default CURRENT_TIMESTAMP,
    data_prevista date not null,
    data_devolucao date null,
    status_locacao VARCHAR(20) DEFAULT 'ABERTO' CHECK(status_locacao IN ('ABERTO','DEVOLVIDO','ATRASADO')),
    id_jogo int not null,
    id_cliente int not null,
    constraint PK_locacao PRIMARY KEY (id_locacao),
    constraint fk_locacao_jogo FOREIGN key (id_jogo)
    references jogo(id_jogo),
    constraint fk_locacao_cliente FOREIGN key (id_cliente)
    references cliente(id_cliente)
);

-- 6. ALTER TABLE
alter table jogo add desenvolvedora varchar(100);


-- Fase 2 - DML: manipulação de dados (25 pontos)
select * from cliente;

-- 7.Inserir Clientes
insert into cliente (nome, email, telefone, ativo) values 
('Ana Silva', 'ana@email.com', 199999901, true),
 ('Bernardo Freitas', 'bernardo@email.com', 199999902, true),
('Camila Dias', 'camilaa@email.com', 199999903, true),
('Douglas Ferreira', 'douglas@email.com', null, true);

-- 8. Inserir Plataformas, Categorias e Jogos
insert into categoria (descricao) VALUES
('RPG'),
('Simulação'),
('Esportes e Corrida'),
('Plataforma e Aventura');

insert into plataforma (nome) VALUES
('Xbox'),
('PlayStation'),
('Nintendo');

insert into jogo (titulo, codigo, desenvolvedora, ano_lancamento, quantidade_disponivel, id_categoria, id_plataforma) VALUES
('GTA V', 1001,'Rockstar North' ,2013, 4, 1, 2),
('EA Sports FC 24', 1002,'EA Vancouver' ,2023, 7, 3, 1),
('The Sims 3', 1003, 'Maxis',2009, 5, 2, 2),
('EA Sports UFC 3', 1004, 'EA Vancouver',2018, 6, 3, 2),
('Gran Turismo 3', 1005,'Polyphony Digital' ,2001, 7, 3, 2 ),
('Super Mario Bross', 1006, 'Nintendo',1985, 4, 4, 3 );

-- 9. Inserir Locaçoes
insert into locacao (data_retirada, data_prevista, data_devolucao, status_locacao,id_cliente, id_jogo) VALUES
(NOW(), '2026-12-11', null, 'ABERTO',1,1),
(NOW(), '2026-12-11', null, 'ABERTO',2,2),
(NOW(), '2026-12-11', null, 'ABERTO',3,3);


-- 10. SELECT + UPDATE
update cliente
SET telefone = '199999904'
Where id_cliente = 4

-- 11. UPDATE em lote
update jogo
set quantidade_disponivel =  QUANTIDADE_DISPONIVEL + 2
where ano_lancamento >= 2000;

SELECT * from jogo;

-- 12. DELETE e proteção do histórico
SELECT * from cliente;

insert into cliente(nome, email, telefone, ativo) values
('Cliente temporario', 'temporario@gmail.com', '199999999', true);

delete from cliente
where id_cliente = 5;

delete from cliente
where id_cliente = 1;
-- Resposta: Erro. Não é possivel pois esse cliente possui locacoes e depende da tabela locacao para ser deletado (chave estrangeira)

-- Fase 3 - DQL: consultas e análise (30 pontos)

-- 13. SELECT básico
select titulo, ano_lancamento, quantidade_disponivel from jogo;

-- 14. WHERE + ORDER BY
select * from jogo
where quantidade_disponivel > 2
ORDER BY quantidade_disponivel desc;

-- 15. LIKE
select titulo from jogo
where titulo like '%Sports%';

-- 16. BETWEEN
select titulo, ano_lancamento from jogo
where ano_lancamento BETWEEN 1990 and 2005;

-- 17. Funções agregadas
select count(*) as total_jogo,
avg(quantidade_disponivel) as media_jogo,
sum(quantidade_disponivel) as soma_jogo,
min(quantidade_disponivel) as minimo_jogo,
max(quantidade_disponivel) as maximo_jogo
from jogo;


-- 18. INNER JOIN
select l.id_locacao, c.nome, j.titulo, l.data_retirada, l.status_locacao
from locacao as l 
inner join cliente as c
on c.id_cliente = l.id_cliente
inner join jogo as j
on j.id_jogo = l.id_jogo;

--19. JOIN + WHERE
select l.id_locacao, c.nome, j.titulo, l.data_retirada , l.status_locacao 
from locacao l
inner join cliente c on l.id_cliente = c.id_cliente
inner join jogo j on l.id_jogo = j.id_jogo
where l.status_locacao = 'ABERTO';

-- 20. GROUP BY
select c.nome, count(l.id_locacao)as quantidade_locacoes
from cliente c
inner join locacao l on l.id_cliente = c.id_cliente
group by c.id_cliente, c.nome
order by quantidade_locacoes desc, c.nome asc;

-- 21. LEFT JOIN
select c.nome, count(l.id_locacao) as quantidade_locacoes
from cliente c
left join locacao l on l.id_cliente = c.id_cliente
group by c.id_cliente, c.nome
order by c.nome asc;


-- Fase 4 - TCL: Transações e integridade (20 pontos)

--22. Transação de locação

START TRANSACTION;
insert into locacao (data_retirada, data_prevista, data_devolucao, status_locacao,id_cliente, id_jogo) values
(NOW(), '2026-12-11', null, 'ABERTO',4,4);
update jogo
set quantidade_disponivel = quantidade_disponivel - 1
where id_jogo = 4;
SELECT * FROM locacao;
SELECT *FROM jogo;
COMMIT;


--23. ROLLBACK

START TRANSACTION;
insert into locacao (data_retirada, data_prevista, data_devolucao, status_locacao,id_cliente, id_jogo) values
(NOW(), '2026-12-11', null, 'ABERTO',1,5);
update jogo
set quantidade_disponivel = quantidade_disponivel - 1
where id_jogo = 5;
SELECT * FROM locacao;
SELECT *FROM jogo;
ROLLBACK;
COMMIT;

--24. SAVEPOINT

START TRANSACTION;
UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 2;
SAVEPOINT reajustes_retrogame;
UPDATE jogo
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_jogo = 3;
ROLLBACK TO SAVEPOINT reajustes_retrogame;
SELECT * FROM jogo WHERE id_jogo IN (1, 3);
COMMIT;

--25. Transação de devolução

SELECT * FROM locacao;
SELECT*FROM jogo;

START TRANSACTION;
UPDATE locacao
set status_locacao = 'DEVOLVIDO',
data_devolucao = '2026-10-15'
where id_locacao = 4;
UPDATE jogo
set  quantidade_disponivel = quantidade_disponivel + 1
where id_jogo = 5;
COMMIT;

-- ANÁLISE TÉCNICA 
