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

-- PARTE II - RELAÇÕES ENTRE ENTIDADES
-- JOINS - CONSULTA DE ENTIDADES RELACIONADAS
-- INNER JOIN - RETORNA REGISTROS QUE POSSUEM CORRESPONDÊNCIA ENTRE DUAS TABELAS
-- EX 1: PEDIDOS COM O NOME DO CLIENTE
SELECT P.ID_PEDIDO, P.DATA_PEDIDO, C.NOME AS CLIENTE, P.VALOR_TOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE;

-- OBS: RELACIONE O CLIENTE CUJO ID_CLIENTE É IGUAL AO ID_CLIENTE FEITO NO PEDIDO
-- APELIDOS COMO REFERÊNCIAS OU ALIAS - P E C SÃO ALIASES QUE DEIXAM A CONSULTA COM VÁRIAS TABELAS MAIS CURTAS E LEGÍVEIS.

-- LEFT JOIN MANTEM TODOS OS REGISTROS DA ESQUERDA, MESMO SEM CORRESPONDÊNCIA NA DIREITA
-- EX 2.1 : TODOS OS CLIENTES, INCLUSIVE QUEM NUNCA COMPROU
SELECT C.NOME, P.ID_PEDIDO, P.DATA_PEDIDO
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
ORDER BY C.NOME;

-- EX 2.2: CLIENTES SEM PEDIDOS
SELECT C.ID_CLIENTE, C.NOME
FROM CLIENTE AS C
LEFT JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.ID_PEDIDO IS NULL;

-- JOIN COM TRÊS TABELAS
-- EX 3.1: ITENS DE PEDIDO COM NOME DE PRODUTO
SELECT P.ID_PEDIDO, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO;

-- EX 3.2 PRODUTO E NOME DE SUA CATEGORIA
SELECT PR.NOME AS PRODUTO, CA.NOME AS CATEGORIA, PR.PRECO
FROM PRODUTO AS PR
INNER JOIN CATEGORIA AS CA
ON CA.ID_CATEGORIA = PR.ID_CATEGORIA
ORDER BY CA.NOME, PR.NOME;

-- AGREGAÇÃO E JOIN
-- EX 4.1 - QUANTIDADE DE PRODUTOS POR CATEGORIA
SELECT CA.NOME AS CATEGORIA, COUNT(PR.ID_PRODUTO) AS QTDE_PRODUTOS
FROM CATEGORIA AS CA
LEFT JOIN PRODUTO AS PR
ON PR.ID_CATEGORIA = CA.ID_CATEGORIA
GROUP BY CA.ID_CATEGORIA, CA.NOME
ORDER BY QTDE_PRODUTOS DESC;

-- EX 4.2 - TOTAL DE COMPRAS POR CLIENTE
SELECT C.NOME AS CLIENTE, COUNT(P.ID_PEDIDO) AS QTDE_PEDIDOS, SUM(P.VALOR_TOTAL) AS TOTAL_COMPRADO
FROM CLIENTE AS C
INNER JOIN PEDIDO AS P
ON P.ID_CLIENTE = C.ID_CLIENTE
WHERE P.STATUS = 'ABERTO'
GROUP BY C.ID_CLIENTE, C.NOME
ORDER BY TOTAL_COMPRADO DESC;

-- RELATÓRIO COMPLETO DO PEDIDO
-- EX 5: VÁRIAS ENTIDADES OU TABELAS EM UMA CONSULTA DE RELATÓRIO
SELECT P.ID_PEDIDO, DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') AS DATA,
C.NOME AS CLIENTE, PR.NOME AS PRODUTO, IP.QUANTIDADE, IP.PRECO_UNITARIO, IP.QUANTIDADE * IP.PRECO_UNITARIO AS SUBTOTAL
FROM PEDIDO AS P
INNER JOIN CLIENTE AS C
ON C.ID_CLIENTE = P.ID_CLIENTE
INNER JOIN ITEM_PEDIDO AS IP
ON IP.ID_PEDIDO = P.ID_PEDIDO
INNER JOIN PRODUTO AS PR
ON PR.ID_PRODUTO = IP.ID_PRODUTO
ORDER BY P.ID_PEDIDO, PR.NOME;

--  DATE_FORMAT(P.DATA_PEDIDO, '%d %m %Y %H:%i') - PADRÃO DE FORMATAÇÃO BRASIL 
-- D = DIA
-- M = MÊS
-- Y = ANO
-- H = HORA
-- i = MINUTOS

-- CASE - CRIAR CLASSIFICAÇÕES EM RESULTADOS
-- EX 6: (CASE) PERMITE CRIAR CLASSIFICAÇÕES BASEADAS EM REGRAS
SELECT NOME, PRECO,
CASE 
WHEN PRECO < 9.00 THEN 'ECONÔMICO'
WHEN PRECO <= 15.00 THEN 'INTERMEDIÁRIO'
ELSE 'PREMIUM'
END AS FAIXA_PREÇOS
FROM PRODUTO
ORDER BY PRECO;

-- SUBCONSULTA
-- EX 7: É UMA CONSULTA DENTRO DE UMA OUTRA CONSULTA 
-- PRODUTOS ACIMA DO PREÇO MÉDIO
SELECT NOME, PRECO
FROM PRODUTO
WHERE PRECO > (SELECT AVG(PRECO) FROM PRODUTO)
ORDER BY PRECO DESC;