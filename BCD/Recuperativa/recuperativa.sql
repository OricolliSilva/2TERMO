-- Active: 1788435084193@@127.0.0.1@3308@retrogame_recuperacao
-- FASE 1 - DDL 

-- 1 ---------------------------------------------------------------
CREATE DATABASE retrogame_recuperacao;
USE retrogame_recuperacao;

-- 2 ---------------------------------------------------------------

CREATE TABLE CLIENTES (
    ID_USUARIO INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(100) NOT NULL,
    EMAIL VARCHAR(120) NOT NULL UNIQUE,
    TELEFONE VARCHAR(20) NULL,
    ATIVO BOOLEAN DEFAULT TRUE
);

-- 3 -------------------------------------------------------------------

CREATE TABLE PLATAFORMA (
    ID_PLATAFORMA INT PRIMARY KEY AUTO_INCREMENT,
    NOME VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE CATEGORIA (
    ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
    DESCRICAO VARCHAR(80) NOT NULL UNIQUE
);
-- 4 --------------------------------------------------------------------

CREATE TABLE JOGO (
    ID_JOGO INT PRIMARY KEY AUTO_INCREMENT,
    TITULO VARCHAR(150) NOT NULL,
    CODIGO VARCHAR(15) NOT NULL UNIQUE,
    ANO_LANCAMENTO INT NOT NULL, 
    QUANTIDADE_DISPONIVEL INT DEFAULT 0 CHECK ( QUANTIDADE_DISPONIVEL >= 0),
    ID_PLATAFORMA INT NOT NULL,
    ID_CATEGORIA INT NOT NULL,
    CONSTRAINT FK_JOGO_PLATAFORMA FOREIGN KEY (ID_PLATAFORMA) REFERENCES PLATAFORMA (ID_PLATAFORMA),
    CONSTRAINT FK_JOGO_CATEGORIA FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIA (ID_CATEGORIA)
);

-- 5 ----------------------------------------------------------------------

CREATE TABLE LOCACAO (
    ID_LOCACAO INT PRIMARY KEY AUTO_INCREMENT,
    DATA_RETIRADA DATETIME DEFAULT CURRENT_TIMESTAMP,
    DATA_PREVISTA DATE NOT NULL,
    DATA_DEVOLUCAO DATE NULL,
    STATUS_LOCACAO VARCHAR(20) DEFAULT 'ABERTA' CHECK (STATUS_LOCACAO IN ('ABERTA', 'DEVOLVIDA', 'ATRASADA')),
    ID_USUARIO INT NOT NULL,
    ID_JOGO INT NOT NULL,
    CONSTRAINT FK_LOCACAO_CLIENTES FOREIGN KEY (ID_USUARIO) REFERENCES CLIENTES (ID_USUARIO),
    CONSTRAINT FK_LOCACAO_JOGO FOREIGN KEY (ID_JOGO) REFERENCES JOGO (ID_JOGO)
);
-- 6 ----------------------------------------------------------------------

ALTER TABLE JOGO ADD DESENVOLVEDORA VARCHAR(100)

-- 7 ----------------------------------------------------------------------

INSERT INTO CLIENTES (NOME, EMAIL, TELEFONE, ATIVO) VALUES
('NICOLAS FILIPE', 'NICOLASFILIPE@EMAIL.COM', '19999999999', TRUE),
('MATHEUS ORICOLLI', 'MATHEUSORICOLLI@GMAIL.COM', '13131313131', TRUE),
('OTAVIO CORREIA', 'OTAVIOCORREIA@EMAIL.COM', NULL, TRUE);

-- 8 -----------------------------------------------------------------------

INSERT INTO PLATAFORMA (NOME) VALUES
('STEAM'),
('EPIC GAMES');

INSERT INTO CATEGORIA (DESCRICAO) VALUES
('TERROR'),
('ENIGMAS');

INSERT INTO JOGO (TITULO, CODIGO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL, ID_PLATAFORMA, ID_CATEGORIA) VALUES
('BRAWL STARS', 'CODIGO1', 2019, 4, 1, 2),
('FORTINITE', 'CODIGO2', 2017, 17, 2, 1),
('THE LAST OF US', 'CODIGO3', 2017, 3, 2, 1),
('FIFA', 'CODIGO4', 1993, 39, 1, 2),
('THE LEGEND OF ZELDA', 'CODIGO5', 2026, 42, 2, 1),
('SONIC PICO PARK', 'CODIGO6', 2026, 67, 1, 2)

-- 9 ------------------------------------------------------------------------

INSERT INTO LOCACAO (DATA_PREVISTA, STATUS_LOCACAO, ID_USUARIO, ID_JOGO) VALUES
('2026-11-12', 'ABERTA', 1, 2),
('2026-11-12', 'ABERTA', 2, 3),
('2026-11-12', 'ABERTA', 3, 4);

UPDATE JOGO 
SET quantidade_disponivel = quantidade_disponivel - 1 
WHERE ID_JOGO = 1;

UPDATE JOGO 
SET quantidade_disponivel = quantidade_disponivel - 1 
WHERE ID_JOGO = 2;

UPDATE JOGO 
SET quantidade_disponivel = quantidade_disponivel - 1 
WHERE ID_JOGO = 3;

-- 10 -------------------------------------------------------------------------

SELECT ID_USUARIO, NOME, EMAIL, TELEFONE FROM CLIENTES

UPDATE CLIENTES
SET TELEFONE = '19676767676'
WHERE ID_USUARIO = 1

-- 11 -------------------------------------------------------------------------

UPDATE JOGO
SET QUANTIDADE_DISPONIVEL = QUANTIDADE_DISPONIVEL + 2
WHERE ANO_LANCAMENTO >= 2000;

-- 12 ------------------------------------------------------------------------

INSERT INTO CLIENTES (NOME, EMAIL,TELEFONE) VALUES
('Samira Dalosto', 'samiradalosto@email.com', NULL);

DELETE FROM CLIENTES
WHERE EMAIL = 'samiradalosto@email.com';

-- 13 ------------------------------------------------------------------------

SELECT TITULO, ANO_LANCAMENTO, QUANTIDADE_DISPONIVEL FROM jogo

-- 14 ------------------------------------------------------------------------
SELECT titulo, quantidade_disponivel
FROM JOGO
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;

-- 15 -----------------------------------------------------------------------
SELECT ID_JOGO, TITULO, ANO_LANCAMENTO
FROM JOGO
WHERE titulo LIKE '%STARS%';

-- 16 ------------------------------------------------------------------------

SELECT ID_JOGO, TITULO, ANO_LANCAMENTO
FROM JOGO
WHERE ANO_LANCAMENTO BETWEEN 1990 AND 2005;

-- 17 ------------------------------------------------------------------------

SELECT
    COUNT(*) AS total_jogos,
    SUM(QUANTIDADE_DISPONIVEL) AS ESTOQUE_TOTAL,
    AVG(QUANTIDADE_DISPONIVEL) AS MEDIA_DO_ESTOQUE,
    MIN(QUANTIDADE_DISPONIVEL) AS MENOR_ESTOQUE,
    MAX(QUANTIDADE_DISPONIVEL) AS MAIOR_ESTOQUE
FROM JOGO;

-- 18 ------------------------------------------------------------------------

SELECT
    L.ID_LOCACAO,
    C.NOME AS NOME,
    J.TITULO AS TITULO,
    L.DATA_RETIRADA,
    L.STATUS_LOCACAO
FROM LOCACAO L
INNER JOIN CLIENTES C ON L.ID_USUARIO = C.ID_USUARIO
INNER JOIN JOGO J ON L.ID_JOGO = J.ID_JOGO;


-- 19 ------------------------------------------------------------------------

SELECT
    L.ID_LOCACAO,
    C.NOME AS NOME,
    J.TITULO AS TITULO,
    L.DATA_RETIRADA,
    L.STATUS_LOCACAO
FROM LOCACAO L
INNER JOIN CLIENTES C ON L.ID_USUARIO = C.ID_USUARIO
INNER JOIN JOGO J ON L.ID_JOGO = J.ID_JOGO
WHERE L.STATUS_LOCACAO = 'ABERTA';

-- 20 --------------------------------------------------------------------------

SELECT
    C.ID_USUARIO,
    C.NOME,
    COUNT(L.ID_LOCACAO) AS QUANTIDADE_LOCACOES
FROM CLIENTES C
INNER JOIN LOCACAO L ON C.ID_USUARIO = L.ID_USUARIO
GROUP BY C.ID_USUARIO, C.NOME
ORDER BY QUANTIDADE_LOCACOES DESC;

