-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
Id_Cliente int auto_increment primary key PRIMARY KEY,
Nome_Cliente varchar(60)
)

CREATE TABLE Pedido (
Id_Pedido int auto_increment primary key PRIMARY KEY,
Data_Pedido datetime not null,
Id_Cliente int auto_increment primary key,
FOREIGN KEY(Id_Cliente) REFERENCES Cliente (Id_Cliente)
)

CREATE TABLE Produto+Estoque (
Id_Produto int auto_increment primary key,
Nome_Produto varchar(60) not null,
Id_Estoque int auto_increment primary key,
Quantidade int not null,
PRIMARY KEY(Id_Produto,Id_Estoque)
)

CREATE TABLE Fornecedor (
Id_Fornecedor int auto_increment primary key PRIMARY KEY,
Razao_Social varchar(100) not null
)

CREATE TABLE Produto (
Id_Produto int auto_increment primary key PRIMARY KEY,
Nome_Produto varchar(100) not null
)

CREATE TABLE Item_Produto (
Id_Produto int not null,
Id_Fornecedor int not null,
Id_Item int auto_increment primary key PRIMARY KEY,
Valor decimal(10,2)
)

