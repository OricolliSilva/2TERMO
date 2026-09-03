create database if not exists somativa_oricolli;
use somativa_oricolli;

CREATE TABLE IF NOT EXISTS clientes (
    id_clientes INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(60) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    idade VARCHAR(15),
    email varchar(60),
    telefone varchar (12) not null
);

CREATE TABLE IF NOT EXISTS marcas (
    id_marcas INT AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(50) NOT NULL,
    pais_origem VARCHAR(70) NOT NULL UNIQUE,
    ano_criacao year,
    redes_sociais varchar(60),
    email varchar(60)
);

CREATE TABLE IF NOT EXISTS funcionarios (
    id_funcionarios INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionarios VARCHAR(60) NOT NULL,
    cpf VARCHAR(15) NOT NULL UNIQUE,
    cargo VARCHAR(30),
    anos_experiencia int not null,
    salario decimal(10,2) not null
);

CREATE TABLE IF NOT EXISTS veiculos(
    id_veiculos INT AUTO_INCREMENT PRIMARY KEY,
    categoria_veiculos varchar (50),
    tipo_veiculo enum ('carro', 'moto') default 'carro',
    ano_veiculo year,
    cor_veiculo varchar(14),
    placa varchar(20)
);

CREATE TABLE IF NOT EXISTS fornecedores (
    id_fornecedores INT AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(60) NOT NULL,
    cnpj VARCHAR(20) NOT NULL,
    produto VARCHAR(30),
    email_fornecedor varchar(30) not null,
    telefone varchar(12) not null
);

CREATE TABLE IF NOT EXISTS pagamento(
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    data_vencimento date not null,
    forma_pagamento enum ('PIX', 'credito', 'debito') default 'PIX',
    status_pagamento enum ('realizado', 'nao_realizado') default 'nao_realizado',
    data_pagamento date not null,
    valor_pago decimal(10,2) not null
);

CREATE TABLE IF NOT EXISTS modelos (
    id_modelo INT AUTO_INCREMENT PRIMARY KEY,
    cores VARCHAR(20),
    categoria VARCHAR(50),
    nome_modelo VARCHAR(60),
    ano_modelo year,
    valor_modelo decimal(10,2) not null
);

CREATE TABLE IF NOT EXISTS servicos(
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(40),
    valor_mao_obra decimal(10, 2) not null,
    valor_servico decimal(10, 2) not null,
    tempo_para_finalizar time not null,
    tipo_servico varchar(40)
);

CREATE TABLE IF NOT EXISTS pecas(
    id_pecas INT AUTO_INCREMENT PRIMARY KEY,
    descricao_peca VARCHAR(40),
    nome_peca varchar(40),
    tipo_peca varchar(40),
    quantidade int not null,
    material varchar(40)
);
 
 CREATE TABLE IF NOT EXISTS ordem_de_servico(
    id_ordem INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(40),
    valor decimal(10, 2) not null,
    trabalho_para_fazer decimal(10, 2) not null,
    tempo_estimado varchar(40),
    situacao varchar(40)
);

ALTER TABLE ordem_de_servico ADD EMAIL VARCHAR(100) NOT NULL;
ALTER TABLE pecas ADD categoria VARCHAR(100) NOT NULL;
ALTER TABLE servicos ADD data_servicos date NOT NULL;
ALTER TABLE modelos ADD fabricacao VARCHAR(100) NOT NULL;
ALTER TABLE pagamento ADD boleto varchar(100) NOT NULL;
ALTER TABLE fornecedores ADD valor_frete decimal(10, 2) NOT NULL;
ALTER TABLE veiculos ADD material_veiculo VARCHAR(100) NOT NULL;
ALTER TABLE funcionarios ADD email varchar(100) NOT NULL;
ALTER TABLE marcas ADD cor_marca VARCHAR(100) NOT NULL;
ALTER TABLE clientes ADD data_cadastro date NOT NULL;

RENAME TABLE modelos TO modelos_fab;

ALTER TABLE ordem_de_servico DROP COLUMN EMAIL;