-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE fornecedor (
Id_fornecedor int auto_increment primary key PRIMARY KEY,
cnpj varchar(18) not null,
email_empresa varchar(100),
telefone_empresa varchar(15) not null,
nome_empresa varchar(100) not null
)

CREATE TABLE Clientes (
CPF varchar (15) not null,
Nome varchar (50) not null,
Id-Cliente int auto_increment primary key PRIMARY KEY,
data_cadastro Texto(1),
email varchar(50) not null,
idade int not null,
Telefone Texto(1)
)

CREATE TABLE Produtos (
Id-Produto int auto_increment primary key PRIMARY KEY,
preco_produto decimal(10,2) not null,
categoria Texto(1),
status_produto varchar(50) not null,
nome_produto varchar(100) not null,
descricao_produto varchar(255)
)

CREATE TABLE Pedidos (
Id-Pedido int auto_increment primary key PRIMARY KEY,
tipo_pedido Texto(1),
data_pedido Texto(1),
status_pedidos Texto(1),
status Texto(1),
data_hora Texto(1),
valor_total Texto(1)
)

CREATE TABLE Pagamento (
forma_pagamento Texto(1),
valor_pago Texto(1),
status_pagamento Texto(1),
data_hora_pagamento Texto(1),
Id-Pagamento int auto_increment primary key PRIMARY KEY
)

CREATE TABLE Delivery (
endereco_entrega Texto(1),
taxa_entrega Texto(1),
status_entrega Texto(1),
Id-Delivery int auto_increment primary key PRIMARY KEY,
data_hora_saida Texto(1),
horario_saida Texto(1)
)

CREATE TABLE Funcionarios (
nome varchar(50) not null,
cargo varchar(50) not null  ,
CPF varchar(14) not null,
salario decimal(10,2) not null,
Id-Funcionários int auto_increment primary key PRIMARY KEY,
data_adimissao Texto(1)
)

CREATE TABLE Programa_de_fidelidade (
Id_fidelidade int auto_increment primary key  PRIMARY KEY,
pontos_acumulados Texto(1),
Saldo_pontos Texto(1),
data_ulrima_atualizacao Texto(1),
data_expiracao date ,
nivel_fidelidade Texto(1)
)

CREATE TABLE categoria (
descricao varchar(25),
Id_categoria int auto_increment primary key PRIMARY KEY,
setor_preparo varchar (50) not null,
nome_categoria varchar(50) not null
)

CREATE TABLE Estoque (
Id-Estoque int auto_increment primary key  PRIMARY KEY,
unidade_medida Texto(1),
data_ultima_reposicao date,
quantidade_minima int not null default = 0,
quantidade_maxima int not null,
quantidade_atual int not null default = 0
)

CREATE TABLE participa (
Id_fidelidade int ,
Id-Cliente int,
FOREIGN KEY(Id_fidelidade) REFERENCES Programa_de_fidelidade (Id_fidelidade),
FOREIGN KEY(Id-Cliente) REFERENCES Clientes (Id-Cliente)
)

CREATE TABLE realiza (
Id-Pedido int ,
Id-Cliente int ,
FOREIGN KEY(Id-Pedido) REFERENCES Pedidos (Id-Pedido),
FOREIGN KEY(Id-Cliente) REFERENCES Clientes (Id-Cliente)
)

CREATE TABLE fornece (
Id-Produto int,
Id_fornecedor int,
FOREIGN KEY(Id-Produto) REFERENCES Produtos (Id-Produto),
FOREIGN KEY(Id_fornecedor) REFERENCES fornecedor (Id_fornecedor)
)

CREATE TABLE classifica (
Id-Produto int,
Id_categoria int,
FOREIGN KEY(Id-Produto) REFERENCES Produtos (Id-Produto),
FOREIGN KEY(Id_categoria) REFERENCES categoria (Id_categoria)
)

CREATE TABLE atende (
Id-Pedido int ,
Id-Funcionários int,
FOREIGN KEY(Id-Pedido) REFERENCES Pedidos (Id-Pedido),
FOREIGN KEY(Id-Funcionários) REFERENCES Funcionarios (Id-Funcionários)
)

CREATE TABLE Entrega (
Id-Delivery int ,
Id-Funcionários int,
FOREIGN KEY(Id-Delivery) REFERENCES Delivery (Id-Delivery),
FOREIGN KEY(Id-Funcionários) REFERENCES Funcionarios (Id-Funcionários)
)

CREATE TABLE contém (
Id-Pedido int,
Id-Produto int,
FOREIGN KEY(Id-Pedido) REFERENCES Pedidos (Id-Pedido),
FOREIGN KEY(Id-Produto) REFERENCES Produtos (Id-Produto)
)

CREATE TABLE possui (
Id-Pagamento int,
Id-Pedido int,
FOREIGN KEY(Id-Pagamento) REFERENCES Pagamento (Id-Pagamento),
FOREIGN KEY(Id-Pedido) REFERENCES Pedidos (Id-Pedido)
)

CREATE TABLE gera (
Id-Delivery int,
Id-Pedido int,
FOREIGN KEY(Id-Delivery) REFERENCES Delivery (Id-Delivery),
FOREIGN KEY(Id-Pedido) REFERENCES Pedidos (Id-Pedido)
)

CREATE TABLE consome (
Id-Estoque int,
Id-Produto int,
FOREIGN KEY(Id-Estoque) REFERENCES Estoque (Id-Estoque),
FOREIGN KEY(Id-Produto) REFERENCES Produtos (Id-Produto)
)

