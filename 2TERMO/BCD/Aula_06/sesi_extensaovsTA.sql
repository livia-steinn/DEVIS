create database if not exists sesi_extensaovsTA;

use sesi_extensaovsTA;

-- visualizar todo os bancos de dados
show schemas;

create table if not exists alunos(
    id_aluno int not null auto_increment primary key,
    nome_aluno varchar(70) not null,
    cpf_aluno char(14) not null unique,
    data_nascimento date not null,
    data_cadastro timestamp default current_timestamp
);  

-- visualizar informacoes sobre os dados da tabela
describe alunos;

