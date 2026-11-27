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

drop FUNCTION consultar_desconto;
delimiter $$
create function consultar_desconto
(
    p_valor decimal(10,2),
    p_pontos int
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


-- 6. Criar auditoria_preco

create table mudanca_dos_precos(
    id_mudanca int auto_increment,
    id_produto int not null,
    preco_anterior decimal(10,2),
    preco_novo decimal(10,2),
    alterado_em datetime default CURRENT_TIMESTAMP,
    constraint pk_id_mudanca PRIMARY key (id_mudanca),
    constraint fk_id_produto FOREIGN KEY (id_produto) references produto(id_produto)
);

delimiter $$


-- 7. Trigger AFTER UPDATE de preço

create trigger trg_mudanca_preco_update
after update on produto
for each row
begin
    if old.preco <> new.preco then
        insert into mudanca_dos_precos
        (id_produto, preco_anterior, preco_novo)
        values (new.id_produto, old.preco, new.preco);
    end if;
end $$
delimiter;

-- 8. Trigger BEFORE UPDATE impedindo estoque negativo

delimiter$$
create trigger trg_qtde_estoque_before_update
before update on estoque
for each row
begin
    if new.quantidade < 0 THEN
        signal sqlstate '45000'
        set message_text ='Estoque não pode ficar negativo!!';
    end if;
end $$
delimiter;

-- 9. Criar log_exclusao_produto

create table log_eliminar_produto
(
    id_log int auto_increment,
    id_produto int,
    nome_produto varchar(120),
    excluido_em datetime default CURRENT_TIMESTAMP,
    constraint pk_id_log primary key (id_log),
    constraint fk_IDproduto FOREIGN key (id_produto) REFERENCES produto(id_produto)
);
delimiter$$


-- 10. Trigger AFTER DELETE
delimiter$$
create trigger trg_produto_eliminado
after delete on produto
for each row
begin
    insert into log_eliminar_produto(id_produto, nome_produto)
    values(old.id_produto, old.nome);
end$$
delimiter;

-- 11. Demonstrar operação bloqueada

insert into estoque (id_produto, quantidade) VALUES
(2, '-6 x');

-- 12. Demonstrar histórico gerado automaticamente

SELECT * from estoque;

-- 13. SHOW TRIGGERS

show triggers;

-- 14. SHOW CREATE TRIGGER

show CREATE TRIGGER trg_produto_eliminado;

-- 15. Explique: Function x Procedure x View x Trigger
--TRIGGERS - é uma rotina associada a uma tabela que é executada automaticamente quando ocorre um insert, delete, update
--VIEW: select....from view - colsulta reutilizavel - vw_pedidos_abertos
--PROCEDURE: call... - processo com varias etapas - registrar_pedido
--FUNCTION: dentro da expressao/SELET - calculo ou classificacao - caulcular_desconto

-- 16. Cite 3 regras em que CHECK/UNIQUE/FK seriam melhores que Trigger

-- Check - Maneira mais rápida de sinalizar que o parametro tem que ser maior que 0.
-- Unique - Maneira de sinalizar que o parametro é unico, ou seja nenhum outro podera ter o mesmo.
-- FK - Maneira de sinalizar relação entre as tabelas, a fim de melhorar as informações de uma tabelas



-- DESAFIO: crie uma automação própria e justifique a escolha do recurso.

delimiter $$
create trigger trg_criar_estoque_inicial
after insert on produto
for each row
begin
    insert into estoque (id_produto, quantidade)
    values (new.id_produto, 0);
end $$
delimiter;

-- O trigger executa a ação no momento do cadastro, evitando que um produto fique sem seu registro inicial de estoque.

