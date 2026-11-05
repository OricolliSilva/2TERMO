Parte A — Básico Fundamentos

-- 1. Crie vw_produtos_ativos .
CREATE VIEW vw_produtos_ativos AS 
SELECT id_produto, nome, preco 
FROM produto
WHERE ativo = TRUE;
-- 2. Consulte apenas produtos da view com preço maior que R$ 10,00.
SELECT * FROM vw_produtos_ativos
WHERE preco >= 10.00
ORDER BY preco DESC;
-- 3. Liste todas as views do banco.
SHOW FULL TABLES WHERE TABLE_TYPE = 'VIEW'; 
-- 4. Exiba a definição de vw_produtos_ativos .
SHOW CREATE VIEW vw_produtos_ativos;
Parte B — Relacionamentos Intermediário

-- 5. Crie vw_produtos_categorias usando INNER JOIN.
CREATE VIEW vw_produtos_categorias AS
SELECT p.id_produto, p.nome AS produto, ca.nome AS categoria, p.preco 
FROM produto AS p 
INNER JOIN categoria as ca 
ON ca.id_categoria = p.id_categoria;
-- 6. Crie vw_pedidos_clientes .
CREATE VIEW vw_pedidos_clientes AS
SELECT p.id_pedido, p.data_pedido, p.status, c.id_cliente, c.nome AS cliente
FROM pedido AS p
INNER JOIN cliente AS c
ON c.id_cliente = p.id_cliente;
-- 7. Consulte somente pedidos FINALIZADOS pela view.
SELECT * FROM vw_pedidos_clientes
WHERE status = 'FINALIZADO';
-- 8. Crie uma view com pedido, produto, quantidade, preço unitário e
-- subtotal.
