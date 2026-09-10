-- comando para criar banco de dados
-- 1 --
create database clinica_medica;
create database if not exists clinica_medica;

-- ativar bd e atualizar schemas
-- 2 --
use clinica_medica;

-- criar tabelas
-- 3 --
create table if not exists pacientes(
id_paciente int auto_increment primary key,
nome_paciente varchar (60) not null,
cpf varchar(14) not null unique,
data_nascimento date not null,
email varchar(100),
telefone varchar(15),
convenio enum ("Sim", "Não") not null
);

create table if not exists funcionarios (
id_funcionario int primary key,
nome_funcionario varchar (60) not null,
cpf varchar(14) not null unique,
telefone varchar(15),
salario decimal(5,2) not null default 0.00
);


-- 4
-- alterar informaçoes da tabela

-- adicionar um campo (atributo) ou coluna na tabela
alter table funcionarios add email varchar(100) not null;

-- alterar tipo de dados de campo (atributo) ou coluna na tabela
alter table funcionarios modify email varchar (50) not null;

-- apagar campo (atributo) ou coluna na tabela
alter table funcionarios drop column email;

-- renomear tabelas
rename table funcionarioss to funcionarios;

-- apagar dados da tabela
truncate table funcionarios;

-- apagar banco de dados
drop database clinica_medica;

-- apagar tabelas
drop tables funcionarios;

-- mostrar tabelas no banco de dados
show tables;















