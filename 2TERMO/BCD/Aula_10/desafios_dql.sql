
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
