
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Lívia Stein
-- Turma: A                                 Data: 09/10/2026
-- Base: smartcoffee_dql
-- ============================================================
USE smartcoffee_dml_livia;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.

select * from clientes;

-- 2. Exiba apenas nome, cidade e e-mail dos clientes.

select nome, cidade, email from clientes;

-- 3. Liste os nomes das cidades sem repetir valores.

select DISTINCT cidade 
from clientes;

-- 4. Liste todos os produtos em ordem crescente de preço.

select nome, preco from produto
order by preco asc;

-- 5. Mostre apenas os 5 produtos mais caros.

select nome, preco
from produto
order by preco DESC
limit 5 offset 5;

-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.

select nome, preco from produto 
where preco between 8 and 15;

-- 7. Liste os clientes das cidades Limeira ou Americana.

SELECT nome, cidade FROM clientes
WHERE cidade IN ('Limeira');

SELECT nome, cidade FROM clientes
WHERE cidade IN ('Americana');

-- 8. Localize os produtos cujo nome contém a palavra “Café”.

select nome from produto
where nome like 'Café%';

-- 9. Liste os clientes que não informaram telefone.

select nome, telefone from clientes
where telefone is null;

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.

select id_pedido, valor_total
from pedido
where status = 'FINALIZADO'AND valor_total > 20.00
ORDER BY valor_total DESC;


-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.

select count(*) as total_produtos
from produto;

-- 12. Mostre menor preço, maior preço e preço médio dos produtos.

select round(min(preco),2) as preco_baixo,
    round(max(preco),2) as preco_alto,
    round(avg(preco),2) as media_produtos
from produto;

-- 13. Informe quantos clientes existem em cada cidade.

select cidade, COUNT(*) as quantidade_clientes
from clientes
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.

select cidade, COUNT(*) as quantidade_clientes
from clientes
GROUP BY cidade
HAVING COUNT(*) >=2;

-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.

select sum(valor_total) as faturamento
from pedido
where status = 'FINALIZADO';

-- PARTE D - RELACIONAMENTOS

-- 16. Liste cada pedido exibindo id, data, nome do cliente, status e valor total.

select p.id_pedido, p.data_pedido, c.nome, p.status as clientes, p.valor_total
from pedido as p inner join clientes as c
on c.id_cliente = p.id_cliente;

-- 17. Liste cada produto acompanhado do nome de sua categoria.

SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME, PR.NOME;

-- 18. Gere um relatório dos itens vendidos: pedido, produto, quantidade,
--     preço unitário e subtotal.

SELECT P.ID_PEDIDO AS PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;

-- 19. Mostre todos os clientes, inclusive aqueles que nunca fizeram pedidos.

SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM clientes AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- 20. Liste apenas os clientes que nunca fizeram pedidos.

SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- PARTE E - DESAFIO GERENCIAL

-- 21. Informe quantos pedidos FINALIZADOS cada cliente realizou e quanto
--     cada cliente gastou. Ordene do maior gasto para o menor.

SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM clientes AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'Finalizado'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- 22. Mostre a quantidade de produtos e o preço médio de cada categoria.

SELECT CA.NOME AS CATEGORIA, COUNT(PR.ID_PRODUTO) AS QUANTIDADE_PRODUTOS,ROUND(AVG(PR.PRECO), 2) AS PRECO_MEDIO
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME;


-- 23. Descubra quais produtos possuem preço superior ao preço médio geral.

SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO) FROM PRODUTO);

-- 24. Classifique os produtos como Econômico, Intermediário ou Premium.
--     Defina e informe suas faixas de preço.

SELECT NOME, PRECO,
CASE 
WHEN PRECO < 9.00 THEN 'ECONÔMICO'
WHEN PRECO <= 19.00 THEN 'INTERMEDIÁRIO'
ELSE 'PREMIUM'
END AS FAIXA_PREÇOS
FROM PRODUTO
ORDER BY PRECO;
