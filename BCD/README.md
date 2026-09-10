Markdown
🗄️ Banco de Dados (BCD)
===

---

📝 1. Conteúdo Programático das Aulas
---

* **Modelagem de Dados**: Conceitos de Modelo Conceitual (MER) e Lógico (DER).
* **Linguagem SQL**: Comandos fundamentais DDL, DML e DQL para manipulação de dados.
* **Normalização**: Aplicação de regras da 1FN, 2FN e 3FN para evitar redundâncias.
* **Relacionamentos e Junções**: Uso de chaves primárias (PK), estrangeiras (FK) e cláusulas JOIN.
* **Recursos Avançados**: Visões (Views), Stored Procedures e Triggers em SGBDs.

---

📐 2. Modelagem de Dados e Normalização
---

* **Modelo Conceitual**: Diagramação de alto nível identificando entidades, atributos e relacionamentos.
* **Modelo Lógico**: Mapeamento para estrutura relacional com definição de tabelas e chaves.
* **Integridade de Dados**: Regras para garantir consistência e evitar anomalias de atualização.
* **Formas Normais**: Processo sequencial de otimização para eliminar duplicidade de dados.

---

💾 3. Linguagem SQL (DDL e DML)
---

* **DDL (Data Definition Language)**: Definição da estrutura do banco de dados (`CREATE`, `ALTER`, `DROP`).
* **DML (Data Manipulation Language)**: Inserção, atualização e remoção de registros (`INSERT`, `UPDATE`, `DELETE`).
* **Tipos de Dados**: Otimização de colunas com tipos adequados (`INT`, `VARCHAR`, `DECIMAL`, `DATE`).

🧬 Exemplo: Criação de Tabelas e Relacionamento (DDL)

```sql
-- Criação da tabela de Categorias
CREATE TABLE categorias (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
);

-- Criação da tabela de Produtos com Chave Estrangeira (FK)
CREATE TABLE produtos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10, 2) NOT NULL,
    categoria_id INT,
    FOREIGN KEY (categoria_id) REFERENCES categorias(id) ON DELETE CASCADE
);
🔍 4. Consultas e Junções (DQL)
DQL (Data Query Language): Seleção e filtragem de dados com SELECT, WHERE e ORDER BY.

Funções de Agregação: Cálculo de métricas e agrupamentos utilizando COUNT, SUM, AVG e GROUP BY.

Junções (JOINs): Combinação de tabelas relacionais (INNER JOIN, LEFT JOIN, RIGHT JOIN).

📊 Exemplo: Consulta Avançada com INNER JOIN e Agregação

SQL
-- Consulta que lista categorias, total de produtos e preço médio por categoria
SELECT 
    c.nome AS categoria,
    COUNT(p.id) AS total_produtos,
    AVG(p.preco) AS preco_medio
FROM categorias c
INNER JOIN produtos p ON c.id = p.categoria_id
WHERE p.preco > 10.00
GROUP BY c.nome
HAVING COUNT(p.id) > 0
ORDER BY total_produtos DESC;