-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: Lívia Stein Pereira
-- Turma: A Data: 02/10/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_livia;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.

insert into clientes (nome, email, telefone, cidade, ativo) values
('Alice Lopes', 'alice.lopes@email.com', '19999999999', 'São Paulo', true),
('João Queiroz', 'joao.queiroz@email.com', '19888888888', 'Rio de Janeiro', true);

select * from clientes;

-- 2. Cadastre a categoria 'Especiais da Casa'.

insert into categoria (nome) values
('Especiais da Casa 2');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.

set @categorias_novas = (select nome from categoria where id_categoria = 'Especiais da Casa');

set @categorias_novas = LAST_INSERT_ID();

select @categorias_novas;
insert into produto(nome,preco, ativo, id_categoria ) VALUES
('Croassant Recheado', 19.00, true, @categorias_novas),
('Strudel de Maçã', 28.90, true, @categorias_novas),
('Focaccia', 27.89, true, @categorias_novas);

-- 4. Cadastre um terceiro cliente sem telefone.

insert into clientes (nome, email, telefone, cidade, ativo) values
('Maria Silva', 'maria.silva@email.com', null, 'Campinas', true);

-- 5. Crie um novo pedido para um dos clientes cadastrados.

insert into pedido (data_pedido, status, valor_total, id_cliente) values
(NOW(), 'Preparando', 45.19, 20);


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.

set @pedido_atividade = LAST_INSERT_ID();

insert into item_pedido (id_produto, id_pedido, quantidade, preco_unitario) values
(1, @pedido_atividade, 2, 19.00),
(2, @pedido_atividade, 1, 28.90);

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

select * from clientes;

update clientes
set telefone = '19994935449'
where id_cliente = 16;

select * from clientes;

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.

select * from clientes;

update clientes
set telefone = '19991355587',
    cidade = 'Limeira'
where id_cliente = 17;

select * from clientes;

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.

select * from produto;

UPDATE produto
SET preco = preco * 1.08
WHERE id_categoria = 11;

select * from produto;

-- 10. Altere o status do pedido criado para 'PREPARANDO'.

select * from pedido;

UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_pedido = 18;

select * from pedido;

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).

SELECT * from item_pedido;

UPDATE pedido
SET valor_total = 28.90
WHERE id_pedido = 18;

SELECT * from pedido;

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).

SELECT * from produto;

UPDATE produto
SET ativo = False
WHERE id_produto = 16;

SELECT * from produto;

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.

select * from clientes;

insert into clientes (nome, email, telefone, cidade, ativo) values
('Lais Garcia', 'lais.garcia@email.com', '19992647335', 'Pindamonhangaba', true);


DELETE FROM clientes
WHERE id_cliente = 22;

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:

-- Error: Cannot delete or update a parent row: a foreign key constraint fails (smartcoffee_dml_livia.pedido, CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente))

select* from pedido;

-- DELETE FROM clientes
-- WHERE id_cliente = 1;

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta: Não deixou deletar porque o o cliente possui informações em outra tabela(pedido), e apagar somente o cliente deixaria o pedido sem cliente, em vão, porque elas são ligadas pela chave estrangeira


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.

insert into categoria (nome) values
('Excluir Depois');

SELECT * FROM categoria;

delete from categoria
where nome = 'Excluir Depois';

-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?

INSERT INTO produto (nome, preco, id_categoria)
VALUES ('Torta Holandesa', 10.00, 9999);
-- Erro que apareceu: Error: Cannot add or update a child row: a foreign key constraint fails (smartcoffee_dml_livia.produto, CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria) REFERENCES categoria (id_categoria))
-- Resposta: A restrição de chave estrangeira fk_produto_categoria impediu a operação, pois não existe uma categoria com id_categoria = 9999.


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?

INSERT INTO clientes (nome, email, cidade)
VALUES ('Ana', 'ana@email.com', 'São Paulo');
--Erro que apareceu: Error: Duplicate entry 'ana@email.com' for key 'clientes.email'
-- Resposta: A restrição UNIQUE da coluna email impediu a operação, pois o endereço 'ana@email.com' já está cadastrado.



-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?

INSERT INTO pedido (data_pedido, status, id_cliente)
VALUES (NOW(), 'Aberto', 9999);
-- Resposta: A restrição de chave estrangeira fk_pedido_cliente impediu a operação, pois não existe cliente com id_cliente = 9999.



-- 20. Escreva em comentários a diferença entre os três erros anteriores.

-- Resposta: Nos erros 17 e 19, a chave estrangeira bloqueia referências a uma categoria ou cliente que não existe. No erro 18, a restrição UNIQUE bloqueia o uso de um e-mail que já está cadastrado.


-- PARTE E - DESAFIO COMPLETO COM TRANSAÇÃO

-- 21. Inicie uma transação.

start TRANSACTION;

-- 22. Dentro dela, cadastre um cliente, um pedido e dois itens relacionados.

INSERT INTO clientes (nome, email, cidade)
VALUES ('Antonio Freitas', 'antorio.freitas@email.com', 'Rio Claro');
SET @id_cliente = LAST_INSERT_ID();

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES (NOW(), 'Aberto', 20.84, @id_cliente);
SET @id_pedido = LAST_INSERT_ID();

INSERT INTO item_pedido (id_produto, id_pedido, quantidade, preco_unitario)
VALUES
(1, @id_pedido, 1, 8.50),
(2, @id_pedido, 1, 12.30);

-- 23. Faça uma consulta com JOIN comprovando que os registros existem
--     enquanto a transação está aberta.

SELECT c.nome AS cliente, p.id_pedido, p.status, pr.nome AS produto, ip.quantidade, ip.preco_unitario
FROM clientes c
JOIN pedido p ON p.id_cliente = c.id_cliente
JOIN item_pedido ip ON ip.id_pedido = p.id_pedido
JOIN produto pr ON pr.id_produto = ip.id_produto
WHERE p.id_pedido = @id_pedido;

-- 24. Execute ROLLBACK e depois use SELECT para provar que o cadastro foi desfeito.

ROLLBACK;

SELECT * FROM clientes WHERE id_cliente = @id_cliente;
SELECT * FROM pedido WHERE id_pedido = @id_pedido;
SELECT * FROM item_pedido WHERE id_pedido = @id_pedido;

-- 25. Repita o processo com novos dados e finalize usando COMMIT.
--     Depois consulte os registros persistidos.

START TRANSACTION;

INSERT INTO clientes (nome, email, cidade)
VALUES ('Marina Lima', 'marina.lima@email.com', 'Campinas');
SET @id_cliente = LAST_INSERT_ID();

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente)
VALUES (NOW(), 'Aberto', 12.37, @id_clientet);
SET @id_pedido = LAST_INSERT_ID();

INSERT INTO item_pedido (id_produto, id_pedido, quantidade, preco_unitario)
VALUES
(1, @id_pedido, 1, 8.50),
(2, @id_pedido, 1, 12.30);

COMMIT;

SELECT c.nome AS cliente, p.id_pedido, p.status, p.valor_total,
       pr.nome AS produto, ip.quantidade, ip.preco_unitario
FROM clientes c
JOIN pedido p ON p.id_cliente = c.id_cliente
JOIN item_pedido ip ON ip.id_pedido = p.id_pedido
JOIN produto pr ON pr.id_produto = ip.id_produto
WHERE p.id_pedido = @id_pedido;

-- DESAFIO EXTRA
-- 26. Escolha uma situação realista do SmartCoffee que exija INSERT + UPDATE
--     ou UPDATE + DELETE lógico. Descreva a regra de negócio e implemente.
