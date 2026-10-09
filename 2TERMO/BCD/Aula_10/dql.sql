-- Aula 09 - DQL (Data Query Language) - Consultas em SQL

-- select coluna 
-- FROM tabela;

-- consulta totas as colunas da tabela
select * from clientes;

-- consultar dados com varias colunas
select nome, telefone from clientes;

-- ex2: consultando e personalizando a consulta

select nome as Nome_cliente, telefone as Contato_cliente 
from clientes;

select nome, preco, preco * 1.00 as preco_ajustado from produtos;


-- ex3: distinct - eliminar repeticao

select DISTINCT cidade 
from clientes;

select cidade from clientes;

-- com distinct cada valor é apresentado apenas uma vez, e sem distinct os resultados é apresentado varias vezes

-- ex4: where - filtrar resultados
-- inserir condicoes e utilizar operadores de comparação

-- = Igual
-- <> ou ! = Diferente
-- > Maior que
-- >= Maior ou igual
-- < Menor que
-- <= Menor ou igual

select nome, preco from produto where preco > 15;
-- consulta todos os produtos com preco maior que 15 reais

select nome, preco from produto where ativo = TRUE;
-- consulta todos os produtos que estão ativos

select id_pedido, data_pedido, valor_total
from pedido where valor_total >= 25.00;
-- consultar valor total de produtos maior ou igual a 25 reais


-- ex5: uso do and, or e not
-- and - todas as condicoes devem ser verdadeiras
select nome, preco from produto
where preco >= 8 and preco <= 25;

-- or - pelo menos uma das condicoes deve ser verdadeira
select nome, cidade from clientes
where cidade = 'Limeira' or cidade = 'Campinas';

-- not - cria uma condição de negacao
select nome, cidade from clientes
where not cidade = 'Limeira';

-- and e or juntos precisamos inserir ()
select nome, cidade, ativo from clientes
where atico = true and (cidade = 'Limeira' or cidade = 'Piracicaba');



--ex6: between - pesquisar por intervalos
-- limite inicial e final

select nome, preco from produto 
where preco between 8 and 15;

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE data_pedido BETWEEN '2026-01-01 00:00:00' AND '2026-09-30 23:59:59';

-- EX 7: IN - MUITAS POSSIBILIDADES
-- CONSULTAR DADOS POR INTERVALO DE DATA
SELECT nome, cidade FROM cliente
WHERE cidade IN ('Limeira','Piracicaba','Americana');

-- ex8: like - pesquisa por textos
-- coringas

-- consulta pela palavra que deseja e qual começa
select nome from produto
where nome like 'Café%';

SELECT nome FROM produto
WHERE nome LIKE '%chocolate%';
-- CONSULTA PELA PALAVRA QUE CONTEM CHOCOLATE

SELECT nome FROM cliente
WHERE nome LIKE '%Silva';

select nome from produto
where nome like '%o_o';

-- ex9: null - ausencia do valor
select nome, telefone from clientes
where telefone is null;

select nome, telefone from clientes
where telefone is not null;

-- ex10: order by - ordenar resultados
-- asc é crescente
-- desc é decrescente

select nome, preco from produto
order by preco asc;

select nome, preco from produto
order by preco desc;

select nome, preco from produto
order by nome asc, preco desc;

select cidade , nome  from clientes
order by cidade asc, nome desc;

-- ex11: limit - determinar uma quantidade de linhas
select nome, preco
from produto
order by preco DESC
limit 5; -- limitou a 5, porem cria paginas com o resto dos produtos

select nome, preco
from produto
order by nome DESC
limit 5 offset 5; -- limitou a 5 em uma unica pagina

-- ex12: calculos em colunas
select nome,preco, preco * 1.30 as preco_ajustado
from produto; 

select id_item, quantidade, preco_unitario, quantidade * preco_unitario as subtotal from item_pedido;

-- ex13: funcoes

--textos
select upper(nome) as nome_m , lower(cidade) as cidade_m
from cliente;

-- uso de maiusculo e minusculo
select concat(nome,'---', cidade) as cliente_cidades
from clientes;

--numeros
select nome, preco, round(preco * 0.90, 2) as preco_desconto
from produto;

-- datas

SELECT id_pedido, data_pedido, valor_total, DATE(data_pedido) AS DATAS, MONTH(data_pedido) AS MÊS, YEAR(data_pedido) AS ANO, DAY(data_pedido) AS DIAS, TIME(data_pedido) AS Horário
FROM pedido;

-- COALESCE : substituir o null no resultado por uma frase

select nome, COALESCE(telefone, 'Não Informado') as telefone
from clientes;


-- ex14: funcoes de agregacao

-- count = contar uma quantidade
-- sum =somar valores
-- avg = calcular media
-- min = minimo valor
-- max = maximo valor

select count(*) as total_cliente
from clientes; -- quantos clientes existem na tabela

select round(avg(preco),2) as preco_medio_produtos
from produto; -- ´preco medio dos produtos



select round(min(preco),2) as precos_baixos
    round(max(preco),2) as precos_altos
    round(avg(preco),2) as media_produtos
from produto; -- resumo de precos

select sum(valor_total) as faturamento
from pedido
where status = 'FINALIZADO'; -- total de pedidos com criterios

-- ex15: group br - agrupar dados

select cidade, COUNT(*) as qtde_clientes
from clientes
GROUP BY cidade; -- quantos clientes tenhos em cada cidade

select id_categoria, count(*) as qtde_produtos
from produto
GROUP BY id_categoria; - quantidade de produtos por categoria

-- ex16: having - criar condicoes em agrupamentos
-- where filtra linhas antes do agrupamento
-- having filtra linhas depois do group by
select cidade, count(*) as qtde_clientes
from clientes
GROUP BY cidade
HAVING COUNT(*) >=2; -- consulta para cidades com pelo menos dois clientes

-- ex17: resumo de uma consulta completa

--SELECT colunas
--FROM tabela
--WHERE condicao
--GROUP BY colunas_agrupar
--HAVING condicao_agrupar
--ORDER BY colunas
--LIMIT quantidade;





