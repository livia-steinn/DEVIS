-- Active: 1794484916109@@127.0.0.1@3306@smartcoffee_procedures_livia
-- Function : Armazena uma rotina criada dentro do MySQL que recebe paremetros, executa uma lógica e devolve um valor com RETURN

--Exemplos de utilização:
--Calculo de frete(valor do frete)
--Escola(classificar médias com aprovado e reprovado)
--Financeiro(calcular juros - valor corrigido)
--Estoque(situação estoque - opcoes de checagem)




--EX 0: Estrutura básica
create function nome_funcao(parametro TIPO)
returns tipo_de_retorno
deterministic
begin
--Processamento
    return valor;
end $$
delimiter;
--Obs. Returns: informa qual tipo será devolvido. RETURN informa o resultado devolvido



--EX 1 : Total de itens
delimiter $$
create function calcular_total_item
(p_preco decimal (10,2), p_quantidade int)
returns DECIMAL(10,2)
deterministic
begin
    return p_preco * p_quantidade;
end $$
delimiter;
--Obs. Agora a funcão pode ser usada como se fosse uma função nativa
select nome, preco, calcular_total_item(preco,3) as total_3_unidades
from produto;



--EX 2 : com decisão - base em fidelidade
delimiter $$
create function classificar_fidelidade
(p_pontos int)
returns varchar(20)
deterministic
begin 
    if p_pontos >= 500 then
        return 'OURO';
    elseif p_pontos >= 200 then
        return 'PRATA';
    else
        return 'BRONZE';
    end if;
end $$
delimiter;

select nome, pontos_fidelidade, classificar_fidelidade
(pontos_fidelidade) as nivel
from cliente;



--EX 3 : exemplo com variavel local
delimiter $$
create function calcular_desconto
(
    p_valor decimal(10,2),
    p_ponton int
)
returns decimal(10,2)
deterministic
begin
    declare v_percentual decimal (5,2);
    if p_pontos >= 500 then 
        set v_percentual = 0.10;
    elseif p_pontos >= 200 then 
        set v_percentual = 0.05;
    else
        set v_percentual = 0;
    end if;
    return p_valor * v_percentual;
end $$
delimiter;
-- Obs. DETERMINISTIC?
-- Uma funcao marcada como deterministic declara que, para os mesmos valores de entrada, o resultado será o mesmo.

-- Comparações entre FUNCTION X PROCEDURE X VIEW

--VIEW: select....from view - colsulta reutilizavel - vw_pedidos_abertos
--PROCEDURE: call... - processo com varias etapas - registrar_pedido
--FUNCTION: dentro da expressao/SELET - caulculo ou classificacao - caulcular_desconto



-- ATIVIDADE AMPLIADA - AULAS 14 E 15

-- 1. Function calcular_total_item

delimiter $$
create function consultar_total_item
(p_preco decimal (10,2), p_quantidade int)
returns DECIMAL(10,2)
deterministic
begin
    return p_preco * p_quantidade;
end $$
delimiter;

-- 2. Function classificar_fidelidade

delimiter $$
create function identificar_fidelidade
(p_pontos int)
returns varchar(20)
deterministic
begin 
    if p_pontos >= 300 then
        return 'NÍVEL 3';
    elseif p_pontos >= 100 then
        return 'NÍVEL 2';
    else
        return 'NÍVEL 1';
    end if;
end $$
delimiter;

-- 3. Function calcular_desconto

delimiter $$
create function consultar_desconto
(
    p_valor decimal(10,2),
    p_ponton int
)
returns decimal(10,2)
deterministic
begin
    declare v_percentual decimal (5,2);
    if p_pontos >= 300 then 
        set v_percentual = 0.10;
    elseif p_pontos >= 100 then 
        set v_percentual = 0.05;
    else
        set v_percentual = 0;
    end if;
    return p_valor * v_percentual;
end $$
delimiter;

-- 4. Function situacao_estoque

delimiter $$
create function situacao_estoque
(q_quantidade int)
returns varchar(20)
deterministic
begin 
    if q_quantidade <= 5 then
        return 'ESTOQUE BAIXO';
    elseif q_quantidade <= 10 then
        return 'ESTOQUE EM ATENÇÃO';
    else
        return 'ESTOQUE ALTO';
    end if;
end $$
delimiter;

-- 5. Testar todas em SELECT

--1.
select nome, preco, consultar_total_item(preco,5) as total_itens
from produto;


-- 2.
select nome, pontos_fidelidade, identificar_fidelidade
(pontos_fidelidade) as nivel
from cliente;

--3.
select consultar_desconto(200.00, 1200) as valor_desconto;

--4.
select id_produto, situacao_estoque(quantidade) as situacao 
from estoque;

select e.id_produto, p.nome as produto, e.quantidade, situacao_estoque(e.quantidade)
as status_estoque
from estoque as e 
inner join produto as p
on e.id_produto = p.id_produto
order by id_produto;

-- TRIGGERS - é uma rotina associada a uma tabela que é executada automaticamente quando ocorre um insert, delete, update
--Aplicacao no dia-a-dia
--Auditoria: registrar preco antigo e novo sempre que um produto muda
--Seguranca:  registrar exclusoes importantes
--Estoque: impedir quantidade negativa
--Hospital: registrar alteracoes em dados criticos
--Financeira: Criar historico de mudanca de status de pagamento

-- EX : 1 Auditoria de preço

create table auditoria_preco(
    id_auditoria int auto_increment,
    id_produto int not null,
    preco_anterior decimal(10,2),
    preco_novo decimal(10,2),
    alterado_em datetime default CURRENT_TIMESTAMP,
    constraint pk_id_auditoria PRIMARY key (id_auditoria),
    constraint fk_produto FOREIGN KEY (id_produto) references produto(id_produto)
);

delimiter $$
create trigger trg_produto_preco_update
after update on produto
for each row
begin
    if old.preco <> new.preco then
        insert into auditoria_preco
        (id_produto, preco_anterior, preco_novo)
        values (new.id_produto, old.preco, new.preco);
    end if;
end $$
delimiter;


select id_produto, nome, preco from produto
where id_produto = 1;

update produto
set preco = 10.50
where id_produto = 1;

select * from auditoria_preco
order by id_auditoria desc;

