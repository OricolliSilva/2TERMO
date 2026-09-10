⚙️ Programação Back-End (PBE)
===

---

📝 1. Conteúdo Programático das Aulas
---

* **Arquitetura Servidor**: Entendimento do modelo Cliente-Servidor e ciclo de Requisição/Resposta (HTTP).
* **APIs RESTful**: Construção de serviços web padronizados utilizando formato JSON.
* **Node.js & Express**: Ambiente de execução assíncrono e framework para gerenciamento de rotas.
* **Arquitetura de Software**: Separação de responsabilidades utilizando o padrão MVC (Model-View-Controller).
* **Persistência & Segurança**: Comunicação com Banco de Dados, tratamento de erros, hash de senhas e autenticação JWT.

---

🌐 2. APIs RESTful e Protocolo HTTP
---

* **Métodos HTTP**: Aplicação dos verbos `GET` (busca), `POST` (criação), `PUT`/`PATCH` (atualização) e `DELETE` (remoção).
* **Códigos de Status**: Tratamento correto de respostas (`200 OK`, `201 Created`, `400 Bad Request`, `401 Unauthorized`, `404 Not Found`, `500 Server Error`).
* **Parâmetros de Requisição**: Captura de dados via `req.params` (URL), `req.query` (filtros) e `req.body` (corpo JSON).
* **Middlewares**: Funções intermediárias para validação de dados, geração de logs e controle de acesso.

---

🚀 3. Desenvolvimento de APIs com Express.js
---

* **Configuração de Rotas**: Mapeamento dos endpoints e manipulação dos dados recebidos.
* **Validação de Dados**: Garantia da integridade dos inputs recebidos no corpo da requisição.
* **Tratamento de Erros**: Estruturação de blocos `try/catch` e middlewares globais para tratamento de exceções.

🛠️ Exemplo: Servidor Básico e Rotas CRUD (Node.js/Express)

```javascript
const express = require('express');
const app = express();

// Middleware para permitir o parse de JSON no corpo da requisição
app.use(express.json());

// Banco de dados em memória para simulação
let usuarios = [
    { id: 1, nome: 'Ana Silva', email: 'ana@email.com' }
];

// Rota GET: Listar todos os usuários
app.get('/usuarios', (req, res) => {
    return res.status(200).json(usuarios);
});

// Rota POST: Criar um novo usuário
app.post('/usuarios', (req, res) => {
    const { nome, email } = req.body;

    if (!nome || !email) {
        return res.status(400).json({ mensagem: 'Nome e e-mail são obrigatórios.' });
    }

    const novoUsuario = { id: usuarios.length + 1, nome, email };
    usuarios.push(novoUsuario);

    return res.status(201).json(novoUsuario);
});

// Inicialização do servidor na porta 3000
app.listen(3000, () => {
    console.log('🚀 Servidor rodando em http://localhost:3000');
});