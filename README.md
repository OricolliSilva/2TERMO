Markdown🎓 2º Termo — Desenvolvimento de Sistemas
===

---

📌 Visão Geral do 2º Termo
---

O **2º Termo** do curso de Desenvolvimento de Sistemas é focado na transição da lógica básica de programação para a construção de **soluções Web Full-Stack reais e integradas**.

Neste semestre, o aprendizado une quatro pilares fundamentais da tecnologia: a **Interface do Usuário (LIMA)**, a **Lógica de Servidor (PBE)**, a **Persistência de Dados (BCD)** e a **Gestão & Integração (Projetos)**. O objetivo final é capacitar a concepção, modelagem, desenvolvimento e entrega de aplicações completas (MVPs) seguindo padrões de mercado.

---

📚 Matérias Técnicas e Aprendizados
---

### 🗄️ BCD — Banco de Dados
Focado no armazenamento, organização, consistência e recuperação das informações de um sistema.
* **Modelagem de Dados**: Criação de Modelos Conceituais (MER) e Lógicos (DER).
* **Normalização**: Aplicação de regras (1FN, 2FN, 3FN) para eliminar redundâncias e anomalias.
* **Linguagem SQL**: Construção de bancos, tabelas e manipulação de dados (`DDL`, `DML`, `DQL`).
* **Consultas Avançadas**: Uso de `JOINs` para cruzar informações e funções de agregação (`GROUP BY`, `COUNT`, `AVG`).

### 🌐 LIMA — Linguagem de Marcação
Focado na construção da camada visual e na experiência do usuário no navegador (Front-End).
* **HTML5 Semântico**: Estruturação de páginas acessíveis, otimizadas para SEO e navegadores.
* **CSS3 Moderno**: Estilização avançada com Box Model, especificidade e variáveis globais.
* **Layouts Responsivos**: Criação de interfaces adaptáveis usando **Flexbox**, **CSS Grid** e Media Queries.
* **Acessibilidade e Formulários**: Interatividade com validações nativas e boas práticas de UX.

### ⚙️ PBE — Programação Back-End
Focado no desenvolvimento das regras de negócio e comunicação no lado do servidor (Server-Side).
* **APIs RESTful**: Criação de rotas padronizadas usando o ecossistema **Node.js** e **Express.js**.
* **Protocolo HTTP**: Manipulação de métodos (`GET`, `POST`, `PUT`, `DELETE`) e códigos de status HTTP.
* **Segurança e Autenticação**: Hash de senhas (`bcrypt`) e proteção de rotas com **JWT (JSON Web Token)**.
* **Integração de Camadas**: Conexão entre as rotas da API e o banco de dados.

### 🚀 Projetos — Gestão e Desenvolvimento
Focado em unificar todas as disciplinas técnicas através de metodologias organizacionais de trabalho.
* **Engenharia de Requisitos**: Mapeamento de Requisitos Funcionais (RF), Não-Funcionais (RNF) e Regras de Negócio (RN).
* **Metodologias Ágeis**: Aplicação de **Scrum** e **Kanban** para divisão de tarefas em Sprints.
* **Prototipagem UI/UX**: Criação de wireframes e protótipos interativos no Figma.
* **Entrega de MVP**: Integração completa do Front-End + Back-End + Banco de Dados.

---

🔗 Integração da Arquitetura Full-Stack
---

Durante o termo, as matérias deixam de ser vistas de forma isolada e passam a funcionar em conjunto na arquitetura de software:

```text
       [ USUÁRIO / NAVEGADOR ]
                  │
                  ▼
    ┌───────────────────────────┐
    │       FRONT-END           │  ---> Desenvolvido em LIMA
    │  (HTML5 + CSS3 + Flex/Grid)│
    └─────────────┬─────────────┘
                  │  Requisições HTTP (JSON)
                  ▼
    ┌───────────────────────────┐
    │        BACK-END           │  ---> Desenvolvido em PBE
    │   (Node.js + Express API) │
    └─────────────┬─────────────┘
                  │  Queries SQL
                  ▼
    ┌───────────────────────────┐
    │      BANCO DE DADOS       │  ---> Estruturado em BCD
    │    (MySQL / PostgreSQL)   │
    └───────────────────────────┘

  ════════════════════════════════════════════════════════════
    Everything managed by: PROJETOS (Scrum, Figma, Requirements)
  ════════════════════════════════════════════════════════════
🛠️ Stack Tecnológica do 2º Termo
Front-End: HTML5, CSS3, Figma (Protótipos).

Back-End: Node.js, Express.js, JavaScript (ES6+), JWT.

Banco de Dados: MySQL / PostgreSQL, DBeaver, MySQL Workbench, brModelo.

Ferramentas & Gestão: VS Code, Git/GitHub, Postman/Insomnia, Trello/Jira.

📂 Estrutura de Pastas do Repositório
Plaintext
📂 2TERMO/
├── 📄 README.md                  # Visão geral do semestre e das disciplinas
├── 📂 BCD/                       # Exercícios, modelagens e scripts SQL
│   ├── 📄 README.md
│   └── ...
├── 📂 LIMA/                      # Páginas web, folhas de estilo e layouts
│   ├── 📄 README.md
│   └── ...
├── 📂 PBE/                       # APIs RESTful, servidores e rotas Node.js
│   ├── 📄 README.md
│   └── ...
└── 📂 Projetos/                  # Documentações, requisitos, diagramas e MVPs
    ├── 📄 README.md
    └── ...
