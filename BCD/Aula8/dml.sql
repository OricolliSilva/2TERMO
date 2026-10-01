-- Active: 1788435084193@@127.0.0.1@3306@smartcoffee_dml_oricolli
-- BANCO DE DADOS - SMARTCOFFEE - DML
-- RECURSO DE RESET DE BANCO DE DADOS
DROP DATABASE IF EXISTS SMARTCOFFEE_DML_ORICOLLI;

CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_DML_ORICOLLI;
USE SMARTCOFFEE_DML_ORICOLLI;

CREATE TABLE CLIENTE (
    ID_CLIENTE INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) UNIQUE,
    TELEFONE VARCHAR(15),
    CIDADE VARCHAR(60) NOT NULL,
    ATIVO BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE PRODUTO (
    ID_PRODUTO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    PRECO DECIMAL(10,2) NOT NULL,
    ATIVO BOOLEAN NOT NULL DEFAULT TRUE,
    ID_CATEGORIA INT NOT NULL,
    CONSTRAINT FK_PRODUTO_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA)
);

CREATE TABLE PEDIDO (
    ID_PEDIDO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_PEDIDO DATETIME NOT NULL,
    STATUS_PEDIDO ENUM('ABERTO', 'PREPARANDO', 'FINALIZADO', 'CANCELADO') NOT NULL,
    VALOR_TOTAL DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    ID_CLIENTE INT NOT NULL,
    CONSTRAINT FK_PEDIDO_CLIENTE FOREIGN KEY (ID_CLIENTE) REFERENCES CLIENTE (ID_CLIENTE)
);
CREATE TABLE ITEM_PEDIDO (
    ID_ITEM INT PRIMARY KEY AUTO_INCREMENT,
    ID_PEDIDO INT NOT NULL,
    ID_PRODUTO INT NOT NULL,
    QUANTIDADE INT NOT NULL,
    PRECO_UNITARIO DECIMAL(10,2) NOT NULL,
    OBSERVACAO VARCHAR(150),
    CONSTRAINT FK_ITEM_PEDIDO FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO (ID_PEDIDO),
    CONSTRAINT FK_ITEM_PRODUTO FOREIGN KEY (ID_PRODUTO) REFERENCES PRODUTO (ID_PRODUTO)
);
CREATE TABLE FORMA_PAGAMENTO (
    ID_FORMA_PAGAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(40) NOT NULL UNIQUE
);
CREATE TABLE PAGAMENTO (
    ID_PAAMENTO INT PRIMARY KEY AUTO_INCREMENT,
    ID_PEDIDO INT NOT NULL,
    ID_FORMA_PAGAMENTO INT NOT NULL,
    VALOR DECIMAL(10,2) NOT NULL,
    DATA_PAGAMENTO DATETIME,
    CONSTRAINT FK_PAGAMENTO_PEDIDO FOREIGN KEY (ID_PEDIDO) REFERENCES PEDIDO (ID_PEDIDO),
    CONSTRAINT FK_PAGAMENTE_FORMA_PAGAMENTO FOREIGN KEY (ID_FORMA_PAGAMENTO) REFERENCES FORMA_PAGAMENTO (ID_FORMA_PAGAMENTO)
);

-- INSERINDO DADOS NO DB
INSERT INTO CLIENTE (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
('Luis Felipe', 'luis@email.com', '19999999901', 'Limeira', TRUE),
('Maria Eduarda', 'maria@email', '19999999902', 'Limeira', TRUE),
('Mateus Silva', 'mateus@email', '19999999903', 'Limeira', TRUE),
('Mateus Oricolli', 'matheus@email', '19999999904', 'Limeira', TRUE),
('Nicolas Filipe', 'nicolas@email', '19999999905', 'Limeira', TRUE),
('Otavio Correia', 'otavio@email', '19999999906', 'Conchal', TRUE),
('Pedro Miranda', 'pedro@email', '19999999907', 'Limeira', TRUE),
('Rafael Vieira', 'rafael@email', '19999999908', 'Limeira', TRUE),
('Rebecca Hernandes', 'rebecca@email', NULL, 'Limeira', TRUE),
('Rennan Campos', 'rennan@email', '19999999909', 'Americana', TRUE),
('Samira Emily Dalosto', 'samira@email', NULL, 'Ourinhos', FALSE),
('Sophia Carolina', 'sophia@email', '19999999911', 'Taubaté', TRUE),
('Stefany Santana', 'stefany@email', NULL, 'Campinas', FALSE),
('Vanessa Queiroz', 'vanessa@email', '19999999913', 'Limeira', TRUE),
('Vinicius Henrique', 'vinicius@email', '19999999914', 'Limeira', TRUE),
('Vinicius Oliveira', 'viniciuso@email', '19999999915', 'Limeira', TRUE);

SELECT * FROM CLIENTE;
INSERT INTO CATEGORIA (NOME) VALUES('Cafe'), ('Bebidas Quentes'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combo');

INSERT INTO produto (nome, preco, ativo, categoria_id) VALUES
('Café Coado', 4.00, TRUE, 1),
('Mocaccino', 8.50, TRUE, 2),
('Limonada Suíça', 6.50, TRUE, 3),
('Brownie com Gelado', 10.50, TRUE, 4),
('Empada de Frango', 5.00, TRUE, 5),
('Combo Café da Manha', 15.00, TRUE, 6);

SELECT * FROM PRODUTO;

INSERT INTO PEDIDO (DATA_PEDIDO, STATUS_PEDIDO, VALOR_TOTAL, ID_CLIENTE) VALUES
('2024-05-20 09:15:00', 'FINALIZADO', 12.50, 1),
('2024-05-20 10:00:00', 'FINALIZADO', 8.50, 2),
('2024-05-20 10:45:00', 'PREPARANDO', 15.50, 3),
('2024-05-20 11:30:00', 'ABERTO', 5.00, 4);

SELECT * FROM PEDIDO;

INSERT INTO ITEM_PEDIDO (ID_PEDIDO, ID_PRODUTO, QUANTIDADE, PRECO_UNITARIO, OBSERVACAO) VALUES
(1, 1, 1, 4.00, 'Sem açúcar'),
(1, 2, 1, 8.50, NULL),
(2, 2, 1, 8.50, 'Chantilly extra'),
(3, 5, 1, 5.00, 'Bem assada'),
(3, 4, 1, 10.50, NULL),
(4, 5, 1, 5.00, NULL);

SELECT * FROM ITEM_PEDIDO;

INSERT INTO PAGAMENTO (ID_PEDIDO, ID_FORMA_PAGAMENTO, VALOR, DATA_PAGAMENTO) VALUES
(1, 4, 12.50, '2024-05-20 09:16:30'),
(2, 1, 8.50, '2024-05-20 10:01:15'),
(3, 2, 15.50, '2024-05-20 10:46:00');

SELECT * FROM categoria;

--ATUALIZAÇÕES E MODIFICAÇÕES E DADOS
UPDATE cliente
SET telefone = '19999999901'
WHERE id_cliente = 

-- TRANSAÇÕES - SEGURANÇA PARA DML
START TRANSACTION;
UPDATE produto
SET preco = preco * 1.5
WHERE id_categoria = 26;

SELECT id_produto, nome, preco 
FROM produto
WHERE id_categoria = 26;

ROLLBACK; --DESFAZ O QUE FIZEMOS DE ERRADO OU VOLTA UMA TRANSAÇÃO
COMMIT; --VALIDA O PROCEDIMENTO DE TRANSAÇÃO

START TRANSACTION;
UPDATE cliente SET cidade = 'Santos' WHERE id_cliente = 121;
COMMIT;
ROLLBACK;

--PROCEDIMENTO DE UMA COMPRA
--PASSO 1: 
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES ('Carlos Silva', 'carlossilva@email.com', '19999999999', 'Santos', TRUE);
SET @cliente_compra = LAST_INSERT_ID();

--PASSO 2:
INSERT INTO pedido (data_pedido, STATUS_PEDIDO, valor_total, id_cliente) VALUES
(NOW(), 'ABERTO', 0.00, @cliente_compra);
SET @pedido_compra = LAST_INSERT_ID();

--PASO 3: INSERINDO ITENS
INSERT into item_pedido (id_pedido, id_produto, quantidade, preco_unitaria)
VALUES (@pedido_compra, 4, 1, 13.00), (@pedido_compra, 9, 1, 9.00);

--PASSO 4 - ATUALIZANDO TOTAL E STATUS
UPDATE pedido
SET valor_total = 22.00,
    ststus = 'PREPARANDO'
WHERE id_pedido = @pedido_compra;

--PASSO 5 - REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pedido, ID_FORMA_PAGAMENTO, valor, data_pagamento)
VALUES (@pedido_compra, 2, 22.00, NOW()); 

--PASSO 6 - CONSULTAR PEDIDO E RESULTADO
SELECT p.id_pedido,
       c.nome AS cliente,
       p.status,
       p.valor_total
FROM pedido p 
JOIN cliente c ON c.ID_CLIENTE = p.ID_CLIENTE
WHERE p.id_pedido = @pedido_compra;

--PASSO 7 - RELATÓRIO
--PASSO 1
SELECT nome FROM cliente WHERE ID_CLIENTE = @cliente_compra;
SELECT nome FROM cliente WHERE id_cliente = 121;

--PASSO 2 
SELECT * FROM pedido WHERE id_pedido = @pedido_compra;