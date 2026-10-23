--DEMONSTRAÇÃO GUIADA - EVOLUINDO EM UMA CONSULTA
--PASSO 1 - VISUALIZAR PRODUTOS

SELECT * FROM PRODUTO;
--PASSO 2 - SOMENTE O NECESSÁRIO
SELECT NOME, PRECO FROM PRODUTO;

--PASSO 3- FILTRAR
SELECT NOME, PRECO FROM PRODUTO
WHERE PRECO >= 10.00

--PASSO 4 - ORDENAR VALORES OU INFORMAÇÕES
SELECT NOME, PRECO FROM PRODUTO
WHERE PRECO >= 10.00
ORDER BY PRECO DESC;

--PASSO 5 - MOSTRAR CATEGORIA

SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
WHERE PR.PRECO >= 10
ORDER BY PR.PRECO DESC;

--PASSO 6 - PERGUNTAS GERENCIAIS

SELECT CA.NOME AS CATEGORIA, COUNT (PR.ID_PRODUTO) AS PRODUTOS, ROUND(AVG(PR.PRECO),2) AS PREÇO_MÉDIO
FROM CATEGORIA AS CA
INNER JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME
ORDER BY PREÇO_MÉDIO DESC;

--CORREÇÃO DA TRANSAÇÃO

--A TRANSAÇÃO FUNCIONA POR ETAPAS SE UMA DELAS FALHAR O PROCESSO PODE GERAR INCONSISTÊNCIA.


--SEM TRANSAÇÃO PARTE DO PROCESSO PERMANECE GRAVADO
--COM TRANSAÇÃO PODEMOS CONFIRMAR OU DESFAZER TUDO

--SINTAXE DE TRANSAÇÃO

START TRANSACTION;
INSERT
UPDATE
INSERT
SELECT
COMMIT;
--MODELO DE FUNCIONAMENO DA TCL

--EX 1: COMMIT CONFIRMA ALTERAÇÕES REALIZADAS DENTRO DA TRANSAÇÃO

START TRANSACTION;
UPDATE PRODUTO
SET PRECO = 9.00
WHERE ID_PRODUTO = 1

SELECT NOME, PRECO FROM PRODUTO;
COMMIT;


--EX 2: ROLLBACK - DESFAZ AS ALTERAÇÕES AINDA NÃO CONFIRMADAS

START TRANSACTION;
UPDATE PRODUTO
SET PRECO = 50.00
WHERE ID_PRODUTO = 1;

SELECT NOME, PRECO FROM PRODUTO;

ROLLBACK;

COMMIT;

--EX3: SAVEPOINT - PONTO DE SALVAMENTO
START TRANSACTION;
UPDATE PRODUTO
SET PRECO = PRECO * 1.05
WHERE ID_CATEGORIA = 1;

SAVEPOINT REAJUSTE_CAFES;

UPDATE PRODUTO
SET PRECO = PRECO * 1.50
WHERE ID_CATEGORIA = 1;

ROLLBACK TO SAVEPOINT REAJUSTE_CAFES;
COMMIT

--EX4 : release savepoint - liberar espeço gravado
release savepoint REAJUSTE_CAFES;

--constraint: não substitui transação
--transação: controla um conjunto de operações
--constraint: impede que deetrminados valores invalidos sejam aceitos

--ex 0 - não atualiza ou restringe valores negativos
CONSTRAINT ck_estoque_quantidade CHECK (quantidade>-0)

-- ex 1- integridade referencial
CONSTRAINT fk_pedido_clientes FOREIGN KEY (id_cliente) references clientes (id_pedido)

--a fk ou chave estrangeira irá impedir que o pedido aponte ou realize um cliente que nao existe

-- ex 2 - on delete
--restrict :bloqueia exclusão com dependentes
--cascade: exclui dependentes
--set null: remove a referencia

CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) references pedido (id_pedido) on delete restrict;
--obs: importante lembrar desses conceitos

--ex 3 - on update
-- define que ocorre com fks quando a chave referenciada á alterada
CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido) references pedido (id_pedido) on delete restrict on update cascade;

-- ex 4 - exclusao fisica e logica
--fisica
delete from produto where id_produto = 10;
--logica
UPDATE produto
set ativo = FALSE
WHERE id_produto = 10;

-- ex 5 - fluxo seguro

SELECT *from produto where id_produto = 3;
start TRANSACTION;
UPDATE produto
SET preco = 12.50
WHERE id_produto
select * FROM produto WHERE id_produto = 3;
COMMIT;
ROLLBACK

--ex 6 - pedido completo

start TRANSACTION;
insert into pedido(data_pedido, status, valor_total, id_cliente) values (now(), 'ABERTO', 0.00,20);
set @pedido = LAST_INSERT_ID();
insert into item_pedido(id_pedido, id_produto, quantidade, preco_unitario) values (@pedido, 1,2,8.00), (@pedido, 1,2,8.00) ;
insert into pagamento(id_pedido, valor,forma_pagamento) values (@peido, 23.00, 'PIX')

COMMIT;

-- fim do pedido

-- UTILIZANDO CONSTRAINT EM TABELA

CREATE TABLE ESTOQUE_ta(
    ID_ESTOQUE INT AUTO_INCREMENT,
    ID_PRODUTO INT NOT NULL,
    QUANTIDADE INT NOT NUL DEFAULT 0,
    --APLICACAO DE INTEGRIDADE REFERENCIAL
    CONSTRAINT PK_ESTOQUE PRIMARY KEY (ID_ESTOQUE), 
    CONSTRAINT UQ_ESTOQUE_PRODUTO UNIQUE (ID_PRODUTO),
    CONSTRAINT CK_ESTOQUE_QUANTIDADE CHECK (QUANTIDADE >= 0),
    CONSTRAINT FK_ESTOQUE_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES
    PRODUTO (ID_PRODUTO) ON UPDATE CASCADE ON DELETE RESTRICT
);

