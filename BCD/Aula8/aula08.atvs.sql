-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: _______________________________________________
-- Turma: ______________________ Data: _________________
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_oricolli;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Memphis Depay', 'memphisdepay@email.com', '19999991234', 'araraquara', TRUE),
('Yuri Alberto', 'yurialberto@email.com', '19999995678', 'campinas', TRUE)

-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES ('Especiais da Casa');

-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SELECT * from categoria;

INSERT INTO produto (nome, preco, id_categoria, ativo) VALUES
('Café Especial de Caramelo', 12.50, 26, TRUE),
('Cappuccino da Casa', 10.00, 26, TRUE),
('Espresso Gelado', 15.00, 26, TRUE);

-- Outro jeito de fazer
-- SELECT * FROM categoria;
-- SET @categoria_especial = SELECT id_categoria FROM categoria WHERE nome = 'Especiais da Casa';
-- INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
-- ('Cupcake', 8.00, TRUE,14),
-- ('Mousse de Chocolate', 25.00, TRUE, 14),
-- ('Fondue', 15.00, TRUE, 14);

-- UTILIZAR O SET ANTES DA TAREFA AJUDA A ARMAZENAR O VALOR DE UMA DEFINIÇÃO ATRIBUÍDA
-- E PODE SER REUTILIZADA

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Sorvete Fit',8.00,TRUE,@categoria_especial);

-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome, email, telefone, cidade) VALUES
('Carlos Oliveira', 'carlos.oliveira@email.com', NULL, 'Limeira');

-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (id_cliente, data_pedido, status, valor_total) 
VALUES (1, NOW(), 'PENDENTE', 0.00);

-- SET @cliente_atividade = (SELECT id_cliente FROM cliente WHERE email =
-- 'luana.a09@email.com');

-- INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
-- (NOW(), 'ABERTO', 0.00, @cliente_atividade);

-- Correção Professor acima

-- _____________________________________________________________________________________

-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
SET @pedido_atividade = LAST_INSERT_ID();

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario) VALUES
(@pedido_atividade, 1, 2, 12.50),
(@pedido_atividade, 2, 1, 10.00);

-- SET @pedido_atividade = LAST_INSERT_ID();

-- INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario)
-- VALUES (@pedido_atividade,4,1,13.00), (@pedido_atividade,9,2,9.00);

--__________________________________________________________________________________________

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
-- SELECT de validação:
-- UPDATE:
-- SELECT final:

ELECT * FROM cliente WHERE nome = Mateus Silva;

UPDATE cliente 
SET telefone = '912345678' 
WHERE nome = Mateus Silva;

SELECT * FROM cliente WHERE nome = Mateus Silva;

--__________________________________________________________________________________________

-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
SELECT * FROM cliente WHERE nome = Luis Felipe;

UPDATE cliente 
SET cidade = 'Porto', telefone = '987654321' 
WHERE nome = Luis Felipe;

SELECT * FROM cliente WHERE nome = Luis Felipe;

--__________________________________________________________________________________________

-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
SELECT * FROM produto WHERE id_categoria = 26;

UPDATE produto 
SET preco = preco * 1.08 
WHERE id_categoria = 26;

SELECT * FROM produto WHERE id_categoria = 26;

--__________________________________________________________________________________________

-- 10. Altere o status do pedido criado para 'PREPARANDO'.
SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;

UPDATE pedido 
SET status = 'PREPARANDO' 
WHERE id_pedido = @pedido_atividade;

SELECT * FROM pedido WHERE id_pedido = @pedido_atividade;

--__________________________________________________________________________________________

-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
--1 VERSÃO

SELECT SUM(quantidade*preco_unitario) AS total
FROM item_pedido
WHERE id_pedido = @pedido_atividade;

UPDATE pedido
SET valor_total = (SELECT SUM(quantidade*preco_unitario) FROM item_pedido
WHERE id_pedido=@pedido_atividade);

--__________________________________________________________________________________________

-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
SELECT * FROM produto WHERE nome = 'Espresso Gelado';

UPDATE produto 
SET ativo = FALSE 
WHERE nome = 'Espresso Gelado';

SELECT * FROM produto WHERE nome = 'Espresso Gelado';

-- SELECT * FROM produto WHERE nome='Croissant Especial';
-- UPDATE produto SET ativo=FALSE WHERE nome='Croissant Especial';
-- SELECT * FROM produto WHERE nome='Croissant Especial';

--__________________________________________________________________________________________

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome, email, telefone, cidade) 
VALUES ('Cliente Teste', 'teste@email.com', '900000000', 'Teste');

SELECT * FROM cliente WHERE email = 'teste@email.com';

DELETE FROM cliente WHERE email = 'teste@email.com';

--__________________________________________________________________________________________

-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:
SELECT * FROM cliente WHERE id_cliente = 1;

-- DELETE FROM cliente WHERE id_cliente = 1;
-- O erro foi: ao deletar não foi possivel pois a chave estrangeira
-- depende de um vínculo de relação com outra tabela

--__________________________________________________________________________________________

-- 15. Explique em comentário por que a FK bloqueou a exclusão.
--Resposta
-- Pois possui dependencias em outra tabela e possui dados com informações

-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (nome) VALUES
('Excluir Depois');

DELETE from categoria
WHERE nome = 'Excluir Depois';

--_______________________________________________________________________________________________
-- PARTE D - INTEGRIDADE E ERROS CONTROLADOS
-- Execute uma tentativa por vez. Depois deixe o comando problemático comentado.

-- 17. Tente inserir um produto com id_categoria = 9999.
-- Qual restrição impediu a operação?


-- 18. Tente cadastrar um cliente usando 'ana@email.com'.
-- Qual restrição impediu a operação?


-- 19. Tente criar um pedido com id_cliente = 9999.
-- Qual restrição impediu a operação?


-- 20. Escreva em comentários a diferença entre os três erros anteriores.
