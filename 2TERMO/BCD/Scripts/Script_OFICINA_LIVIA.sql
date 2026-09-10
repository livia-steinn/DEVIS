create database oficina_livia;

use oficina_livia;

create table if not exists Clientes ( 
 id_clientes int auto_increment primary key,
 nome_cliente varchar(60) not null,
 telefone varchar(15),
 cpf_cliente varchar(11) not null unique,
 email varchar(100),
 endereco varchar(255)
 );
 
 create table if not exists Pagamentos (
 id_pagamentos int auto_increment primary key,
 forma_pagameno varchar(20),
 status_pagamento varchar(30),
 valor_total decimal(10,2),
 parcela char(3) default "Nao",
data_efetuacao timestamp default current_timestamp
 );
 
  create table if not exists Veiculos (
 id_veiculos int auto_increment primary key,
 data_entrada datetime ,
placa_veiculo varchar(7) not null unique,
 marca varchar(20),
 ano_veiculo year,
tipo_de_servico varchar(80)
 );
 
 create table if not exists Modelos (
 id_modelos int auto_increment primary key,
 cor_veiculo varchar(20),
 versao_veiculo varchar(30),
 ano_fabricacao year,
 marca_veiculo varchar(30),
tipo_carro varchar(20)
 );
 
  create table if not exists Marcas (
 id_marcas int auto_increment primary key,
 site varchar(255),
 telefone_sac varchar(15),
 pais_origem varchar(20),
 data_fundacao date,
modelos varchar(50)
 );
 
  create table if not exists Servicos (
 id_servicos int auto_increment primary key,
 local_trabalho varchar(100),
tempo_trabalho time,
 tipo_servico varchar(100),
 pecas_usadas varchar(100),
preco_base decimal(10,2)
 );
 
  create table if not exists Funcionarios (
 id_funcionarios int auto_increment primary key,
 cpf_funcionario varchar(11) not null unique,
 setor varchar(30),
 salario decimal(10,2),
 cargo varchar(30) not null,
nome_funcionario varchar(80) not null
 );
 
  create table if not exists Ordens (
 id_ordens int auto_increment primary key,
 valor_servico decimal(10,2),
 descricao varchar(100),
 problema varchar(255),
tipo_servico varchar(100),
funcionario_servico varchar(80)
 );
 
  create table if not exists Pecas (
 id_pecas int auto_increment primary key,
 tipo_peca varchar(60),
 chassi_peca varchar(10) unique,
 valor_peca decimal(6,2),
 quantidade_pecas int,
nome_peca varchar(100)
 );
 
  create table if not exists Fornecedores (
 id_fornecedores int auto_increment primary key,
 nome_empresa varchar(60),
 CNPJ varchar(18) not null unique,
 local_fornecedor varchar(80),
 email varchar(100),
telefone varchar(15)
 );
 
 RENAME TABLE Modelos TO Modelos_fab;
 
ALTER TABLE Clientes ADD data_nascimento date;
ALTER TABLE Pagamentos ADD bandeira_cartao varchar(20);
ALTER TABLE Veiculos ADD tipo_veiculo varchar(30);
ALTER TABLE Marcas ADD email varchar(100);
ALTER TABLE Funcionarios ADD especializacoes varchar(40);
ALTER TABLE Servicos ADD instrucoes varchar(100);
ALTER TABLE Pecas ADD localizacao_estoque varchar(100);
ALTER TABLE Fornecedores ADD devolucao varchar(100);
ALTER TABLE Ordens ADD nivel_urgencia varchar(30);
ALTER TABLE Modelos_fab ADD tipo_cambio varchar(100);

 ALTER TABLE Clientes DROP COLUMN data_nascimento;
