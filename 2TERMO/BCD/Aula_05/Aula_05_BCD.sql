-- comando para criar banco de dados
-- 1 --
create database clinica_medica;
create database if not exists clinica_medica;

create database banco_dados;

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

-- mostrar todos os bancos de dados
show databases;

-- --------------------------------------------------------------------

-- inserir dados no banco de dados
insert into funcionarios (id_funcionario,nome_funcionario,cpf,telefone,salario)
values (1,'Livia', '452.589.478-40','(19)9 9493-5449', 200),
(2,'Bruno', '123.456.789-10','(19)9 9375-7588', 300),
(3,'Isabella', '456.567.678-10','(19)9 9463-7443', 400),
(4,'Gabrielli', '123.789.098-67','(19)9 6747-3452',500);

-- consultar dados no banco de dados
select * from funcionarios;

-- Padrao para data YYYY-MM-DD
insert into pacientes (id_paciente, nome_paciente, cpf, data_nascimento, email, telefone,convenio)
values (default, 'Joana', '345.414.078-18','1990-2-17','joana.silva@gmail.com', '(19)9 9362-3782', 'Sim'), 
(default, 'Carlos', '356.456.123-14','1979-6-28','carlos.souza@gmail.com', '(19)9 9453-4586', 'Não'),
(default, 'Marcela', '562.183.789-80','2005-12-4','marcela.prado@gmail.com', '(19)9 9672-0982', default);

select * from pacientes;
select *from funcionarios, pacientes;










