-- Active: 1794484916109@@127.0.0.1@3306@smartcoffee_procedures_livia
-- AULA 14 - Stored Procedures

-- Stored Procedure é um conjunto de instruções SQL. Depois de criado podemos executar sempre que necessário usando CALL

-- SEM PROCEDURE - A aplicação envia várias instruções e repete a lógica em diferentes lugares
-- COM PROCEDURE - A lógica fica cetralizada em uma rotina que pode receber parâmetros

-- Linha do tempo da procedure
-- Entrada - Procedure - Processamento - Resultado

-- Quando utilizar?
-- Operações Repetidas
-- Consultas Padronizadas
-- Processos com várias instruções 
-- Regras que precisam ser executadas de maneira consistente
-- Rotinas Administrativas

-- Delimiter
-- Dentro de uma Procedure temos vários comandos encerrados por ; para não correr o risco de o MySQL não interpretar o comando correto inserimos o delimitador

-- EX 1 : Comando Inicial

--Instrução e Procedimento
DELIMITER $$
create procedure exemplo1()
begin
    select 'Olá! Mundo! :)';
end 
delimiter;

-- Execução do Procedimento
call exemplo1();

-- EX 2 : Consulta Simples

DELIMITER $$
create procedure listar_produtos()
begin
    SELECT id_produto as código, nome , preco
    FROM produto 
    WHERE ativo = TRUE
    ORDER BY nome; 
END
DELIMITER;


CALL listar_produtos();

-- Obs: A PROCEDURE não recebe parâmetros, apenas executa uma consulta padronizada

-- EX 3 : PARÂMETROS IN -  representa um valor enviado para a procedure

delimiter $$

create Procedure buscar_produtos_categoria (IN P_ID_CATEGORIA INT)
begin
    SELECT id_produto as código, nome, preco
    FROM produto
    WHERE id_categoria = p_id_categoria
    AND ativo = true
    ORDER BY nome;
END
DELIMITER;
call buscar_produtos_categoria(3);

-- EX 4 : PARÂMETRO OUT - devolve um valor através de uma variável do cliente

DELIMITER $$

create procedure contar_produtos_ativos ( out p_total int)
begin
    SELECT count(*)
    INTO p_total
    FROM produto
    WHERE ativo = true;
end $$
delimiter;
--RESULTADO DE QUANTIDADE DE PRODUTOS ATIVOS
call contar_produtos_ativos(@total);
SELECT@total

-- EX 5 : INOUT - recebe um lavor e pode devolver esse mesmo parâmetro

delimiter $$
create Procedure aplicar_bonus_fidelidade (INOUT p_pontos int, in p_bonus int)
begin
    SET p_pontos = p_pontos + p_bonus;
end $$
DELIMITER;

set @PONTOS = 100;
call aplicar_bonus_fidelidade(@PONTOS , 25);
select @PONTOS;

-- EX 6 : variaveis locais - dentro do begin........end podemos declarar variaveis

delimiter $$
create procedure consultar_preco (in p_id_produto int)
begin
    declare v_preco decimal(10,2);

    SELECT preco
    INTO v_preco
    FROM produto
    WHERE id_produto = p_id_produto;

    SELECT v_preco as preco_produto;
end $$
delimiter;
CALL consultar_preco(1);

-- EX 7 : if, elseif, else - procedures com decisões

DELIMITER $$
create Procedure classificar_estoque (in p_id_produto int)
begin
    DECLARE v_quantidade int;

    SELECT quantidade
    INTO v_quantidade
    FROM estoque
    WHERE id_produto = p_id_produto;

    if v_quantidade = 0 THEN
        SELECT 'SEM ESTOQUE' as situação;
    elseif v_quantidade <= 5 THEN
        SELECT 'ESTOQUE BAIXO' as situção;
    ELSE
        select 'ESTOQUE NORMAL' as situação;
    end if;
end $$
DELIMITER;
call classificar_estoque(2);

-- EX 8 : PROCEDURE COM INSERT - cadastrar cliente

DELIMITER $$
create Procedure cadastrar_cliente (
    in p_nome varchar(100),
    in p_email varchar(120),
    in p_telefone varchar(20)
)
begin
    insert into cliente(nome, email, telefone, ativo)
    values(p_nome, p_email, p_telefone, true);
end $$
delimiter;
call cadastrar_cliente ('Bruno Augusto', 'bruno@email', '199999999');

select * from cliente;

-- EX 9 : Procedure para update

delimiter $$
create procedure atualizar_preco_produto (
    in p_id_produto int,
    in p_novo_preco decimal(10,2)
)
begin
    if p_novo_preco > 0 THEN
        update produto
        set preco = p_novo_preco
        WHERE id_produto = p_id_produto;

        select 'PREÇO ATUALIZADO' as mensagem;
    ELSE
        select 'PREÇO INVALIDO' as mensagem;
    end if;
end $$
DELIMITER;
call atualizar_preco_produto(2,14);
SELECT * from produto;

-- EX 10 : Procedure com regra de nogocio e registro de pedido

delimiter $$
CREATE Procedure registar_pedido(
    in p_id_cliente int,
    out p_id_pedido int
)
begin
    start transaction;
    insert into pedido(
        id_cliente,
        data_pedido,
        status_pedido
    )
values(
    p_id_cliente, now(), 'ABERTO'
);

set p_id_pedido = LAST_INSERT_ID();
COMMIT;
end$$
DELIMITER;

call registar_pedido(1,@pedido);
select@pedido;

-- EX 11 : Exemplo completo adicionado item ao pedido

delimiter $$

create procedure adicionar_item_pedido(
    in p_id_pedido int,
    in p_id_produto int,
    in p_quantidade int
)
begin
    declare v_preco decimal(10,2);
    if p_quantidade <= 0 THEN
        select 'QUANTIDADE INVALIDA' as mensagem;
    ELSE
        SELECT preco
        into v_preco
        from produto
        where id_produto = p_id_produto
            and ativo = true;
        
        insert into item_pedido(
            id_pedido, id_produto, quantidade, preco_unitario
        )
        values (
            p_id_pedido, p_id_produto, p_quantidade, v_preco
        );
        select 'ITEM ADICIONADO' as mensagem;
    end if;
end$$
DELIMITER;
call adicionar_item_pedido(1,1,1);
SELECT * from pedido;

-- considerações finais
show PROCEDURE status; -- listar procedures
show create PROCEDURE nome_procedure; -- mostrar a definição de um procedure
drop procedure nome_procedure; -- apagar ou remover procedure
drop procedure if exists nome_procedures; -- remover somente se existir


