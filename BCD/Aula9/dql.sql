-- Active: 1788435084193@@127.0.0.1@3306@smartcoffee_dml_oricolli
-- DQL DATA QUERY LANGUAGE (LINGUAGEM DE CONSULTA DE DADOS)
-- ANTES DE INICIAR

INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('Ana Flávia', 'anaf@email.com', '19999999999', 'Campinas', TRUE);

--EX 1: SELECT OU CONSULTA SIMPLES
--ESREUTURA SELECT COMO EXEMPLO
--SELECT coluna
--FROM tabela
SELECT *
FROM cliente;
-- CONSULTAR TODAS AS COLUNAS

SELECT nome, telefone
FROM cliente;
-- CONSULTAR COLUNAS ESPECIFICAS

-- EX 2: ALIAS COM AS COMO APELIDO AS COLUNAS
SELECT nome AS Nome_Cliente
From cliente;

SELECT email AS Email_Cliente, telefone AS Contato_Cliente
FROM cliente;

-- EX 3: DSTINCT - ELIMINANDO REPETIÇÕES
SELECT DISTINCT cidade
FROM cliente;
-- SEM DISTINCT O RESULTADO IRÁ SE REPETIR MAIS VEZES.
-- COM O DISTINCT O RESULTADO IRÁ APARECER UMA VEZ.

-- EX 4: WHERE - FILTRO POR REGISTROS
-- IREMOS DEFINIR CONDIÇÕES
-- =IGUAL
-- <> OU != DIFERENTE
-- > MAIOR QUER
-- >= MAIOR OU IGUAL
-- < MENOR QUE
-- <= MENOR OU IGUAL 
SELECT nome, preco, ativo AS Status  
FROM produto
WHERE preco = 10.00;
-- CONSULTA PARA VALORES ACIMA DE 10.00
SELECT nome, preco, ativo AS Status  
FROM produto
WHERE ativo = TRUE;
-- CONSULTA STATUS DE CLIENTES, SE ESTÁ INATIVO OU ATIVO

SELECT id_pedido, data_pedido, valor_total
FROM pedido
WHERE valor_total >= 25.00;
-- CONSULTA PEDIDOS ACIMA DE DETERMINADO VALOR

-- EX 5: USO DO AND, OR E NOT
-- AND TODAS AS CONDIÇÕES SÃO VERDADEIRAS
SELECT nome, preco
FROM produtoWHERE preco >= 8.00 AND preco <= 25.00

-- OR PELO MENOS UMA CONDIÇÃO VERDADEIRA
SELECT nome, cidade
FROM cliente
WHERE cidade - 'Limeira' OR 'Piracicaba';

-- NOT NÃO IRÁ BUSCAR OU CONSULTAR O VALOR DESEJADO
SELECT nome, cidade
FROM cliente
WHERE NOT cidade = 'Limeira';

-- EXTRA - UTILIZANDO AND E OR JUNTOS | SEPARAR POR ()
SELECT nome, cidade, ativo
FROM cliente 
WHERE ativo = TRUE
AND (cidade, = 'Limeira' OR cidade = 'Piracicaba');

-- EX 6: BETWEEN - ENTRE DOIS VALORES
-- LIMITE INICIAL E FINAL
SELECT nome, produto
FROM produto
WHERE preco BETWEEN 8.00 AND 15.00;
-- consulta por valores entre 8 e 15

SELECT is_pedido, data_pedido, valor_total
From pedido
WHERE data_pedido, BETWEEN '2026-09-01 00:00:00' AND '2026-09-30 23:59:59'
-- CONSULTA POR INTERVALO DE DATAS  

-- EX 7: IN VÁRIAS POSSIBILIDADES
SELECT nome, cidade
FROM cliente
WHERE cidade IN('Limeira', 'Campinas', 'Americana', 'Piracicaba')
-- CONSULTA COM VÁRIAS CONDIÇÕES E DIMINUINDO O USO DE OR

SELECT nome, cidade
FROM cliente
WHERE cidade NOT IN ('Limeira', 'Piracicaba');
-- CONSULTA COM EXCESSÃO DOS VALOERES ESPECIFICOS

-- EX 8: LIKE - PESQUISAR POR TEXTOS
--CORINGAS
-- % VÁRIOS CARACTERES
-- _ EXATAMENTE UM CARACTER
SELECT nome
FROM produto
WHERE nome LIKE 'Café%';
-- CONSULTA TODOS OS PRODUTOS QUE COMEÇAM COM A PALAVRA DESEJADA

SELECT nome
FROM produto
WHERE nome LIKE '%chocolate%';
-- CONSULTA TODOS OS PRODUTOS QUE POSSUAM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Silva';
-- CONSULTA TODOS OS CLIENTES QUE TERMINAM COM A PALAVRA DESEJADA

SELECT nome
FROM cliente
WHERE nome LIKE '%Si_va';
-- CONSULTA ESPECIFICAMENTE O CARACTER QUE NÃO SE LEMBRA

-- EX 9: NULL - MAUSÊNCIA DE VALORES
SELECT nome, telefone
FROM cliente 
WHERE telefone IS NULL;
--CONSULTA CAMPOS QUE POSSUEM O NULL

SELECT nome, telefone
FROM cliente
WHERE telefone IS NOT NULL;
-- CONSULTA CAMPOS QUE NÃO SÃO MAIS NULL

-- EX 10: ORDER BY - ORDENANDO RESULTADOS
-- ASC CRESCENTE
--DESC DECRESCENTE
SELECT nome, preco 
FROM produto
ORDER BY preco DESC;
-- CONSULTAR DADOS DE FORMA DECRESCENTE

SELECT cidade, nome 
FROM cliente
ORDER BY cidade ASC, nome DESC;
-- CONSULTA POR MAIS DE UMA COLUNA

-- EX 11: LIMIT - LIMITAR QUANTIDADE DE LINHAS
SELECT nome, preco 
FROM produto 
ORDER BY preco DESC
LIMIT 5;
-- consultar apenas uma quantidade especifica de linhas

SELECT nome, preco 
FROM produto
ORDER BY nome 
LIMIT 5 OFFSET 5;
-- CONSULTAR COM LIMITE DE VALORES E LINHAS

--EX 12: CÁLCULO DE COLUNAS 
SELECT nome, preco, preco * 1.10 AS preco_ajustado
FROM produto;

SELECT id_item, quantidade, preco_unitario, quantidade * preco_unitario AS
Sub_Total
FROM item_pedido;

-- EX 13: FUNÇÕES  PARA CONSULTAS
-- TEXTOS
SELECT UPPER(nome) AS Nome_Cliente, LOWER(email) AS Email_cliente
FROM cliente

SELECT CONCAT(nome, ' --- ', cidade) AS Cidade_Clientes
FROM cliente;
-- CONCAT concatenação de valores

--NÚMEROS
SELECT nome, preco, ROUND(preco * 0.90, 2) AS Preco_Desconto
FROM produto;

-- DATAS 
SELECT id_pedido. data_pedido, DATE(data_pedido) AS Datas, MONTH(data_pedido) AS Mês, YEAR(data_pedido) AS Ano, DAY(data pedido) AS Dia, TIME(data_pedido) AS Horário
FROM pedido;

-- COALESCE - SUBSTITUIR A INFORMAÇÃO QUE DEIXAMOS EM NULL OU NÃO DEIXAMOS
SELECT nome, COALESCE(telefone, 'Não Informado') AS telefone 
FROM cliente; 

-- EX 14: FUNÇÕES DE AGRUPAMENTO
-- COUNT - CONTAR QUANTOS REGISTROS EXISTEM
-- SUM - SOMA DE VALORES
-- AVG - MÉDIA DE VALORES
-- MIN - MENOR VALOR
-- MAX - MAIOR VALOR

SELECT COUNT(*) AS TOTAL_CLINTES
FROM clientes;
-- CONTAR QUANTOS CLIENTES EXISTEM

SELECT AVG(preco) AS MÉDIA_PREÇOS
FROM produto;
-- CALCULAR MÉDIA DE PREÇO DOS PRODUTOS

SELECT MIN(preco) AS MENOR_PREÇO, MAX(preco) AS MAIOR_PREÇO, AVG(preco) AS MÉDIA_PREÇO
FROM produto;
-- RESUMO DE PREÇOS

SELECT SUM(valor_total) AS Faturamento_Mensal
FROM pedido
WHERE status = 'FINALIZADOS'
-- TOTAL DE VENDAS OU PEDIDOS REALIZADOS COM CRITÉRIO

-- EX 15: GROUP BY - AGRUPAR DADOS
SELECT cidade, COUNT(*) AS Quantidade_Clientes
FROM cliente
GROUP BY cidade;

SELECT id_categoria, COUNT(*) AS Quantidade_Produtos
FROM produto
GROUP BY id_categoria;

-- EX 16: HAVING - FILTRO DE GRUPOS
-- WHERE - FILTRA LINHAS ANTES DO GROUP BY
-- HAVING - FILTRA LINHAS DEPOIS DO GOUP BY
SELECT cidade, COUNT(*) AS QTDE_CLIENTES
FROM cliente
GROUP BY cidade 
HAVING COUNT(*) >= 2;
-- CIDADES COM PELO MENOS DOIS CLIENTES

-- EX 17: ORDEM DE CRIAÇÃO DE UMA CONSULTA COMPLETA
SELECT colunas
FROM tabelas ADDWhere condicao
GROUP BY colunas_agrupar
HAVING condicao_agrupar
ORDER BY colunas
LIMIT quantidade;