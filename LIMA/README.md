🌐 Linguagem de Marcação (LIMA)
===

---

📝 1. Conteúdo Programático das Aulas
---

* **HTML5 Semântico**: Estruturação moderna, acessível e otimizada para motores de busca (SEO).
* **CSS3 Avançado**: Estilização, regras de cascata, especificidade e Box Model.
* **Layouts Modernos**: Construção de interfaces flexíveis utilizando Flexbox e CSS Grid.
* **Design Responsivo**: Adaptação de páginas para múltiplos dispositivos usando Media Queries.
* **Formulários e Mídias**: Validações nativas de entrada de dados e integração multimídia.

---

🏷️ 2. HTML5 Semântico e Acessibilidade
---

* **Tags Semânticas**: Organização de conteúdo com `<header>`, `<nav>`, `<main>`, `<section>`, `<article>` e `<footer>`.
* **Acessibilidade (a11y)**: Uso de atributos ARIA, marcas de suporte a leitores de tela e navegação por teclado.
* **Formulários Interativos**: Tipos de `input` avançados, atributos de validação (`required`, `pattern`, `placeholder`).
* **Boas Práticas de SEO**: Hierarquia correta de títulos (`<h1>` a `<h6>`) e descrição alternativa em imagens (`alt`).

📑 Exemplo: Estrutura Base em HTML5 Semântico

```html
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Página Semântica</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <header class="header-principal">
        <h1>Meu Portal Web</h1>
        <nav>
            <ul>
                <li><a href="#home">Início</a></li>
                <li><a href="#sobre">Sobre</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section id="sobre">
            <h2>Sobre o Projeto</h2>
            <p>Desenvolvimento de interfaces acessíveis utilizando HTML5 semântico.</p>
        </section>
    </main>
</body>
</html>