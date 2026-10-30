-- Active: 1788519247415@@127.0.0.1@3306@biblioteca_livia_som02

------------------------------ SOMATIVA BANCO DE DADOS - 30/10/2026 ---------------------------------

----- FASE 1 — DDL: CRIAÇÃO E ESTRUTURA - 25 pontos ----

-- 1. Criação do banco — 3 pts

CREATE DATABASE if not EXISTS biblioteca_livia_som02;
USE biblioteca_livia_som02;

-- 2. Tabela USUARIO — 6 pts

create table if not exists usuario (
id_usuario int auto_increment primary key,
nome varchar(100) not null,
email varchar(120) not null UNIQUE,
telefone varchar(20),
ativo boolean not null default true
);

-- 3. Tabela LIVRO — 6 pts

create table if not exists livro (
id_livro int auto_increment primary key,
titulo varchar(150) not null,
autor varchar(120) not null,
isbn char(13) not null unique,
ano_publicacao int,
quantidade_disponivel int DEFAULT 0 check (quantidade_disponivel >= 0)
);


-- 4. Tabela EMPRESTIMO — 7 pts

create table if not exists emprestimo (
id_emprestimo int auto_increment primary key,
data_emprestimo datetime DEFAULT CURRENT_TIMESTAMP,
data_prevista date not null,
data_devolucao date,
id_usuario int not null,
id_livro int not null,
status_emprestimo varchar(20) DEFAULT 'ABERTO' check(status_emprestimo in ('ABERTO', 'DEVOLVIDO', 'ATRASADO')),
constraint fk_empretimo_usuario foreign key (id_usuario) references usuario(id_usuario),
constraint fk_emprestimo_livro foreign key (id_livro) references livro(id_livro)
);
------------------------------------------------------------------------------------------------------

CREATE table if not exists categoria(
id_categoria int auto_increment primary key,
nome_categoria varchar(100),
id_livro int not null,
constraint fk_categoria_livro foreign key (id_livro) references livro(id_livro)
);

insert into categoria(nome_categoria, id_livro) VALUES
('Ficção Comercial', 5 ),
('Ficção Comercial', 4 ),
('Ficção Comercial', 6 ),
('Ficção Comercial', 7 ),
('Literatura Clássica', 1 ),
('Fábulas e Narrativas Alegóricas', 2 ),
('Fábulas e Narrativas Alegóricas', 3 );
SELECT * from categoria;


CREATE Table if not exists autores (
id_autores int auto_increment primary key,
nome_autor varchar(120),
nacionalidade varchar(120),
idade int,
livro_mais_conhecido varchar(120)
);

INSERT INTO autores ( nome_autor, nacionalidade, idade, livro_mais_conhecido) VALUES
('Machado de Assis', 'Brasileiro', 69, 'Dom Casmurro'),
('Paulo Coelho', 'Brasileiro', 79, 'O Alquimista'),
('Antoine de Saint-Exupéry', 'Francês', 44, 'O Pequeno Príncipe'),
('J. R. R. Tolkien', 'Britânico', 81, 'O Senhor dos Anéis'),
('J.K. Rowling', 'Britânica', 61, 'Harry Potter e a Pedra Filosofal'),
('John Green', 'Norte-americano', 49, 'A Culpa é das Estrelas'),
('Árthur Conan Doyle', 'Escocês', 71, 'Um Estudo em Vermelho');
SELECT * from autores;

-- 5. ALTER TABLE — 3 pts

alter table livro add editora varchar(100);

---- FASE 2 — DML: MANIPULAÇÃO DE DADOS ----

-- 6. INSERT de usuários — 4 pts

insert into usuario (nome, email, telefone, ativo) values 
('André Silva', 'andre@email.com', 19999999901, true),
 ('Bianca Freitas', 'bianca@email.com', 19999999902, true),
('Carolina Dias', 'carolina@email.com', 19999999903, true),
('Diego Ferreira', 'diego@email.com', null, true);

-- 7. INSERT de livros — 5 pts

insert into livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel) values 
('Dom Casmurro', 'Machado de Assis', '9788594318602', 1900, 2),
('O Alquimista', 'Paulo Coelho', '9788584390670', 1988, 0),
('O Pequeno Príncipe', 'Antoine de Saint-Exupéry', '9788595081512', 1943, 4),
('O Senhor dos Anéis', 'J. R. R. Tolkien', '9786555112511', 1954, 1),
('Harry Potter', 'J.K. Rowling', '9788532530783', 1997, 5),
('A Culpa É das Estrelas', 'John Green', '9788580572261', 2012, 4),
('Sherlock Holmes', 'Árthur Conan Doyle', '9788595080836', 1886, 3);

-- 8. INSERT de empréstimos — 4 pts

insert into emprestimo (data_emprestimo, data_prevista, data_devolucao, id_usuario, id_livro, status_emprestimo) values
('2026-10-03 09:15:00', '2026-10-15','2026-10-17', 1, 1, 'ABERTO'),
('2026-10-05 14:00:00', '2026-10-16','2026-10-19', 2, 2, 'ABERTO'),
('2026-10-08 11:45:00', '2026-10-19','2026-10-22', 3, 3, 'ABERTO'),    
('2026-10-20 11:45:00', '2026-10-24','2026-10-27', 4, 4, 'DEVOLVIDO');

-- 9. UPDATE — 4 pts

select * from usuario
where id_usuario = 4;

update usuario
SET telefone = '19999999904'
Where id_usuario = 4

-- 10. Atualização em lote — 4 pts

-- NÃO CRIEI LIVROS COM ANO_PUBLICACAO DEPOIS DO ANO DE 2020, ENTÃO ADICIONEI 2 EXEMPLARES NO LIVRO DE 2012

select * from livro;

update livro
SET quantidade_disponivel = 6
Where id_livro = 6

-- 11. DELETE e integridade — 4 pts

SELECT * FROM usuario;

insert into usuario (nome, email, telefone, ativo) values 
('Enzo Lima', 'enzo@email.com', 19999999905, true);

delete from usuario
where id_usuario = 5;

delete from usuario
where id_usuario = 1;

-- Apareceu: Error: Cannot delete or update a parent row: a foreign key constraint fails (biblioteca_livia_som02.emprestimo, CONSTRAINT fk_empretimo_usuario FOREIGN KEY (id_usuario) REFERENCES usuario (id_usuario))
-- E não é possivel pois esse usuario possui empréstimos e depende da tabela emprestimo para ser deletado


---- FASE 3 — DQL: CONSULTAS E ANÁLISE - 30 pontos ----

-- 12. SELECT básico — 2 pts

SELECT * FROM livro;

-- 13. WHERE + ORDER BY — 3 pts

select * from livro
WHERE quantidade_disponivel > 2
order by quantidade_disponivel desc;

-- 14. LIKE — 3 pts
select * from livro
where titulo like '%Anéis%' ;


-- 15. BETWEEN — 3 pts

-- NÃO MODIFIQUEI OS LIVROS COM ANO_PUBLICACAO ENTRE 2015 E 2025, ENTÃO MODIFIQUEI ENTRE 1950 E 2000
select * from livro
where ano_publicacao between 1950 and 2000;

-- 16. Funções agregadas — 4 pts

select count(*) as total_livros,
avg(quantidade_disponivel) as media_livros,
sum(quantidade_disponivel) as soma_livros,
min(quantidade_disponivel) as minimo_livros,
max(quantidade_disponivel) as maximo_livros
from livro;

-- 17. INNER JOIN — 4 pts

SELECT E.ID_EMPRESTIMO, U.NOME AS USUARIO, L.TITULO AS LIVRO, E.DATA_EMPRESTIMO, E.STATUS_EMPRESTIMO
FROM EMPRESTIMO AS E
INNER JOIN USUARIO AS U
ON U.ID_USUARIO = E.ID_USUARIO
INNER JOIN LIVRO AS L
ON L.ID_LIVRO = E.ID_LIVRO;

-- 18. JOIN + WHERE — 3 pts

select e.id_emprestimo as id_emprestimo, u.nome as usuario, l.titulo as livro, e.data_emprestimo as data_emprestimo, e.status_emprestimo as status
from emprestimo e
inner join usuario u on e.id_usuario = u.id_usuario
inner join livro l on e.id_livro = l.id_livro
where e.status_emprestimo = 'ABERTO';

-- 19. GROUP BY — 4 pts

select u.nome as usuario, count(e.id_emprestimo) as quantidade_emprestimos
from usuario u
inner join emprestimo e on e.id_usuario = u.id_usuario
group by u.id_usuario, u.nome
order by quantidade_emprestimos desc, u.nome asc;

-- 20. LEFT JOIN — 4 pts

select u.nome as usuario, count(e.id_emprestimo) as quantidade_emprestimos
from usuario u
left join emprestimo e on e.id_usuario = u.id_usuario
group by u.id_usuario, u.nome
order by u.nome asc;

---- FASE 4 — TCL, TRANSAÇÕES E INTEGRIDADE 20 pontos ----


-- 21. Transação de empréstimo — 7 pts

START TRANSACTION;
insert into emprestimo (data_emprestimo, data_prevista, data_devolucao, id_usuario, id_livro, status_emprestimo) values
('2026-10-20 09:15:00', '2026-10-30','2026-11-03', 3, 5, 'ABERTO');
update livro
set quantidade_disponivel - 1
where id_livro = 5;
SELECT * FROM emprestimo;
SELECT *FROM livro;
COMMIT;

-- 22. ROLLBACK — 5 pts

START TRANSACTION;
insert into emprestimo (data_emprestimo, data_prevista, data_devolucao, id_usuario, id_livro, status_emprestimo) values
('2026-10-28 12:44:00', '2026-11-08','2026-11-11', 2, 6, 'ABERTO');
update livro
set quantidade_disponivel - 1
where id_livro = 6;
SELECT * FROM emprestimo;
SELECT *FROM livro;
ROLLBACK;
COMMIT;

-- 23. SAVEPOINT — 4 pts

START TRANSACTION;
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 1;
SAVEPOINT reajustes_biblioteca;
UPDATE livro
SET quantidade_disponivel = quantidade_disponivel - 1
WHERE id_livro = 3;
ROLLBACK TO SAVEPOINT reajustes_biblioteca;
SELECT * FROM livro WHERE id_livro IN (1, 3);
COMMIT;

-- 24. Transação de devolução — 4 pts 

SELECT * FROM emprestimo;
SELECT*FROM livro;

START TRANSACTION;
UPDATE emprestimo
set status_emprestimo = 'DEVOLVIDO',
data_devolucao = '2026-10-15'
where id_emprestimo = 1;
UPDATE livro
set  quantidade_disponivel = quantidade_disponivel + 1
where id_livro = 1;
COMMIT;


--25. Análise técnica: 
-- Para cada situação abaixo, identifique o mecanismo mais adequado entre constraint, integridade referencial, transação ou regra da aplicação, e justifique tecnicamente sua escolha.

-- Cadastrar dois usuários com o mesmo e-mail. - Constraint

-- Cadastrar dois livros com o mesmo ISBN. - Constraint

-- Permitir quantidade disponível negativa. - Constraint

-- Criar empréstimo para usuário inexistente. - Integridade Referencial

-- Excluir livro com histórico de empréstimos. - Integridade Referencial

-- Gravar empréstimo e falhar na redução do estoque. - Transação

-- Emprestar livro cuja quantidade disponível seja zero. - Regra de Aplicação
























