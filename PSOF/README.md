🚀 Desenvolvimento de Projetos
===

---

📝 1. Conteúdo Programático das Aulas
---

* **Engenharia de Requisitos**: Levantamento, análise e documentação de requisitos funcionais e não-funcionais.
* **Metodologias Ágeis**: Aplicação de frameworks como Scrum e Kanban na gestão do ciclo de vida do software.
* **Prototipagem UI/UX**: Criação de wireframes e protótipos navegáveis focados na experiência do usuário.
* **Modelagem e Arquitetura**: Diagramação do sistema (UML, MER) e definição da arquitetura da solução.
* **Integração e MVP**: Unificação de Front-End, Back-End e Banco de Dados para entrega do Produto Mínimo Viável.

---

📋 2. Engenharia de Requisitos e Documentação
---

* **Requisitos Funcionais (RF)**: Definição das funcionalidades diretas e ações que o sistema deve executar.
* **Requisitos Não-Funcionais (RNF)**: Critérios de qualidade, como desempenho, segurança e usabilidade.
* **Regras de Negócio (RN)**: Políticas e restrições operacionais que orientam a lógica do software.
* **User Stories**: Especificação de funcionalidades do ponto de vista do usuário final.

📄 Exemplo: Matriz de Requisitos do Sistema

| ID | Tipo | Descrição | Prioridade |
| :--- | :--- | :--- | :---: |
| **RF-01** | Funcional | O sistema deve permitir o cadastro de novos usuários com e-mail e senha. | Alta |
| **RF-02** | Funcional | O usuário autenticado deve conseguir emitir relatórios em formato PDF. | Média |
| **RNF-01**| Não-Funcional | O tempo de resposta das requisições não deve ultrapassar 2 segundos. | Alta |
| **RN-01** | Regra | Senhas de usuários devem conter no mínimo 8 caracteres e 1 número. | Alta |

---

📊 3. Gestão Ágil e Fluxo de Trabalho (Scrum & Git)
---

* **Scrum Framework**: Organização em Sprints, reuniões diárias (Daily) e entregas incrementais.
* **Quadro Kanban**: Visualização clara das tarefas divididas em *To Do*, *In Progress* e *Done*.
* **Git Flow**: Padronização do versionamento de código com branches (`main`, `develop`, `feature/*`).
* **Documentação Viva**: Atualização constante de repositórios e instruções de deploy.

🌱 Exemplo: Padrão de Commits Semânticos (Conventional Commits)

```bash
# Estrutura padrão: <tipo>(<escopo opcional>): <descrição breve>

# Exemplo de criação de funcionalidade (feature)
git commit -m "feat(auth): adiciona validação de token JWT no login"

# Exemplo de correção de bug (fix)
git commit -m "fix(database): corrige erro de conexão na tabela de usuários"

# Exemplo de atualização de documentação (docs)
git commit -m "docs(readme): atualiza instruções de instalação do projeto"