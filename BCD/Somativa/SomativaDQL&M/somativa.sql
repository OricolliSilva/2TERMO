-- 1 ----------------------------------------------------
DROP DATABASE IF EXISTS biblioteca_som2;
CREATE DATABASE IF NOT EXISTS biblioteca_som2;
USE biblioteca_som2;

-- 2 ----------------------------------------------------
CREATE TABLE USUARIO (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    telefone VARCHAR(20),
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

-- 3 -----------------------------------------------------
CREATE TABLE LIVRO (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    autor VARCHAR(120) NOT NULL,
    isbn CHAR(13) NOT NULL UNIQUE,
    ano_publicacao INT,
    quantidade_disponivel INT
)

-- 4 --------------------------------------------------------
CREATE TABLE EMPRESTIMO (
    id_emprestimo INT PRIMARY KEY AUTO_INCREMENT,
    data_emprestimo DATETIME DEFAULT CURRENT_TIMESTAMP,
    data_prevista DATE NOT NULL,
    data_devolucao DATE,
    status_emprestimo VARCHAR(20),
    id_usuario INT NOT NULL,
    id_livro INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES USUARIO(id_usuario),
    FOREIGN KEY (id_livro) REFERENCES LIVRO(id_livro)
);

-- 5 ------------------------------------------------------------
ALTER TABLE LIVRO ADD COLUMN editora VARCHAR(100);

-- 6 -------------------------------------------------------------
INSERT INTO USUARIO (nome, email, telefone, ativo) VALUES
('Matheus Oricolli', 'matheus.oricolli@email.com', '19999997835', TRUE),
('Nicolas Filipe', 'nicolas.filipe@email.com', '19999998753', TRUE),
('Otavio Correia', 'otavio.correia@email.com', NULL, TRUE),
('Pedro Henrique', 'pedro.henrique@email.com', '19999991234', TRUE);

-- 7 --------------------------------------------------------------
INSERT INTO LIVRO (titulo, autor, isbn, ano_publicacao, quantidade_disponivel, editora) VALUES
('É assim que acaba', 'Colleen Hoover', '9788501112514', 2018, 10, 'Galera Record'),
('É assim que começa', 'Colleen Hoover', '9786559811397', 2022, 3, 'Galera Record'),
('Verity', 'Colleen Hoover', '9788501117847', 2020, 4, 'Galera Record'),
('O lado feio do amor', 'Coller Hoover', '9788501105738', 2015, 2, 'Galera Record'),
('Todas as suas (im)perfeições', 'Coller Hoover', '9788501117687', 2019, 6, 'Galera Record'),
('Novembro, 9', 'Collen Hoover', '9788501076250', 2016, 8, 'Galera Record');

-- 8 ------------------------------------------------------------------
INSERT INTO EMPRESTIMO (data_prevista, status_emprestimo, id_usuario, id_livro) VALUES
('2026-11-10', 'ABERTO', 1, 1),
('2026-11-12', 'ABERTO', 2, 2),
('2026-11-15', 'ABERTO', 3, 5);

-- 9 -------------------------------------------------------------------
SELECT * FROM USUARIO WHERE email = 'otavio.correia@email.com';

UPDATE USUARIO
SET telefone = '19999998765'
WHERE email = 'otavio.correia@email.com';

SELECT * FROM USUARIO WHERE email = 'otavio.correia@email.com';

-- 10 ------------------------------------------------------------------
SELECT id_livro, titulo, ano_publicacao, quantidade_disponivel FROM LIVRO WHERE ano_publicacao >= 2020;

UPDATE LIVRO
SET quantidade_disponivel = quantidade_disponivel + 2
WHERE ano_publicacao >= 2020;

SELECT id_livro, titulo, ano_publicacao, quantidade_disponivel FROM LIVRO WHERE ano_publicacao >= 2020;

-- 11 a) ----------------------------------------------------------------------
INSERT INTO USUARIO (nome, email, telefone) VALUES ('Samira Dalosto', 'samira.dalosto@email.com', '19999999999');
SELECT * FROM USUARIO WHERE email = 'samira.dalosto@email.com';
DELETE FROM USUARIO WHERE email = 'samira.dalosto@email.com';

-- 11 b) ------------------------------------------------------------------------
SELECT * FROM USUARIO WHERE id_usuario = 1;
DELETE FROM USUARIO WHERE id_usuario = 1; 
-- O erro acontece por que 

-- 12 ---------------------------------------------------------------------------
SELECT titulo, autor, quantidade_disponivel
FROM LIVRO;

-- 13 ---------------------------------------------------------------------------
SELECT *
FROM LIVRO
WHERE quantidade_disponivel > 2
ORDER BY quantidade_disponivel DESC;

-- 14 -------------------------------------------------------------------------
SELECT *
FROM LIVRO
WHERE titulo LIKE '%Amor%';

-- 15 -------------------------------------------------------------------------
SELECT *
FROM LIVRO
WHERE ano_publicacao BETWEEN 2015 AND 2025;

-- 16 ------------------------------------------------------------------------
