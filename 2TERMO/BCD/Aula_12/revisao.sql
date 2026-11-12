-- Active: 1794484916109@@127.0.0.1@3306@biblioteca_revisao_livia

-- Criar Tabelas - Usuario, Livro, Emprestimo, Categoria e Fornecedor(Autores)

DROP DATABASE biblioteca_revisao_livia;
-- fase 1 - criacao ddl (estrutura)
-- 1.
create database if not exists biblioteca_revisao_livia;
use biblioteca_revisao_livia;


--2.
--Criação de tabelas
CREATE TABLE usuario (
    ID_USUARIO INT AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20),
    ATIVO BOOLEAN DEFAULT TRUE,
    CONSTRAINT PK_USUARIO PRIMARY KEY (ID_USUARIO),
    CONSTRAINT UQ_EMAIL UNIQUE (EMAIL)
);

--3.
CREATE TABLE livro(
    ID_LIVRO INT AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    AUTOR VARCHAR(120) NOT NULL,
    ISBN CHAR(13) NOT NULL UNIQUE,
    ANO_PUBLICACAO INT,
    QUANTIDADE_DISPONIVEL INT DEFAULT 0 CHECK(QUANTIDADE_DISPONIVEL >= 0),
    id_categoria int not null,
    CONSTRAINT PK_LIVRO PRIMARY KEY(ID_LIVRO), 
    CONSTRAINT UQ_ISBN UNIQUE (ISBN),
    constraint fk_categoria_livro FOREIGN key (id_categoria)
    references categoria(id_categoria)
);

--4.
CREATE TABLE IF NOT EXISTS emprestimo(
    ID_EMPRESTIMO INT AUTO_INCREMENT,
    DATA_EMPRESTIMO DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE,
    STATUS_EMPRESTIMO VARCHAR(20) DEFAULT 'ABERTO' CHECK(STATUS_EMPRESTIMO IN ('ABERTO','DEVOLVIDO','ATRASADO')),
    ID_USUARIO INT NOT NULL,
    ID_LIVRO INT NOT NULL,
    CONSTRAINT PK_EMPRESTIMO PRIMARY KEY (ID_EMPRESTIMO),
    CONSTRAINT FK_USUARIO FOREIGN KEY(ID_USUARIO) REFERENCES USUARIO(ID_USUARIO) on delete cascade,
    CONSTRAINT FK_LIVRO FOREIGN KEY (ID_LIVRO) REFERENCES LIVRO (ID_LIVRO) on delete cascade
);

CREATE Table if not exists categoria (
    id_categoria int AUTO_INCREMENT,
    nome varchar(80) not null unique,
    constraint PK_categoria PRIMARY KEY (id_categoria)
);

create table if not exists fornecedor (
    id_fornecedor int AUTO_INCREMENT,
    cnpj varchar(20) not null unique,
    razao_social varchar(80) not null,
    constraint pk_fornecedor primary key (id_fornecedor),
    constraint uq_cnpj unique (cnpj)
);

--5.
alter Table livro add editora varchar(100);

select * from livro;

-- fase 2 - dml

--6.

insert into usuario(nome, email, telefone, ativo) values
('Bruno', "bruno@gmail.com","19999999901", true),
('Ana', 'ana@gmail.com', '19999999902', true),
('Bia', 'bia@gmail.com', NULL, true),
('Clara', 'clara@gmail.com', '19999999904', true);

--7.

INSERT into categoria(nome) VALUES
('Ficção'),
('Fantasia'),
('Terror'),
('Romance');

select * from categoria;

insert livro (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, id_categoria) VALUES
('Harry Potter', 'J K Rowling', '123456789112', 1997, 30,1 );

--8.
insert into emprestimo (DATA_EMPRESTIMO, DATA_PREVISTA, DATA_DEVOLUCAO, STATUS_EMPRESTIMO, ID_USUARIO ,ID_LIVRO) VALUES
(NOW(), '2026-12-11', null, 'ABERTO',1,1);

--9.

select * from usuario;

update usuario
set TELEFONE = '19999999903'
where ID_USUARIO = 3;

-- 10.
update livro
set QUANTIDADE_DISPONIVEL =  QUANTIDADE_DISPONIVEL + 2
where ANO_PUBLICACAO >= 1990;

SELECT * from livro;

-- 11.
insert into usuario(nome, email, telefone, ativo) values
('temporario', 'temporario@gmail.com', '11111111111', true);

delete from usuario
where id_usuario = 1;

-- Erro. Não é possivel pois esse usuario possui empréstimos e depende da tabela emprestimo para ser deletado (chave estrangeira)


-- fase 3 - dql 
-- 12. 
SELECT titulo, autor, quantidade_disponivel from livro;

-- 13.
select * from livros
where quantidade_disponivel > 2
ORDER BY quantidade_disponivel desc;

--14.

select titulo from livro
where titulo like '%harry%';

-- 15.
select titulo, ano_publicacao from livro
here ANO_PUBLICACAO BETWEEN 1900 and 2025;

