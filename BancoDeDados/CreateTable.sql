DROP TABLE PAIS CASCADE CONSTRAINTS;
DROP TABLE LOGRADOURO CASCADE CONSTRAINTS;
DROP TABLE CIDADE CASCADE CONSTRAINTS;
DROP TABLE ENDERECO CASCADE CONSTRAINTS;
DROP TABLE MONITORAMENTO CASCADE CONSTRAINTS;
DROP TABLE ESTRATEGIAS CASCADE CONSTRAINTS;
DROP TABLE OPORTUNIDADE CASCADE CONSTRAINTS;
DROP TABLE EMPRESA CASCADE CONSTRAINTS;
DROP TABLE OBJETIVO_EMPRESA CASCADE CONSTRAINTS;
DROP TABLE PESQUISA_MERCADO CASCADE CONSTRAINTS;
DROP TABLE ANALISE_DADOS CASCADE CONSTRAINTS;
DROP TABLE RESULTADO_PESQUISA CASCADE CONSTRAINTS;


CREATE TABLE PAIS (
    id_Pais INT PRIMARY KEY,
    nome_Pais VARCHAR2(100)
);

CREATE TABLE CIDADE (
    id_Cidade INT PRIMARY KEY,
    nome_Cidade VARCHAR2(100),
    id_Pais INT
);

CREATE TABLE LOGRADOURO (
    id_Logradouro INT PRIMARY KEY,
    nome_Logradouro VARCHAR2(100),
    id_Cidade INT
);

CREATE TABLE ENDERECO (
    id_Endereco INT PRIMARY KEY,
    numero INT,
    complemento VARCHAR2(100),
    cep VARCHAR2(10),
    id_Logradouro INT
);

CREATE TABLE EMPRESA (
  id_Empresa int PRIMARY KEY,
  nome_Empresa VARCHAR2(200),
  setor_Atuacao VARCHAR2(200),
  email_empresa VARCHAR2(200),
  id_Endereco INT
);

CREATE TABLE OBJETIVO_EMPRESA (
  id_Objetivo int PRIMARY KEY,
  descricao_Objetivo VARCHAR2(200),
  id_Empresa int
);

CREATE TABLE OPORTUNIDADE (
  id_Oportunidade int PRIMARY KEY,
  descricao_Oportunidade VARCHAR2(200)
);

CREATE TABLE ESTRATEGIAS (
  id_Estrategia int PRIMARY KEY,
  descricao_Estrategia VARCHAR2(200)
);

CREATE TABLE MONITORAMENTO (
  id_Monitoramento int PRIMARY KEY,
  descricao_Monitoramento VARCHAR2(200),
  resultados_Monitoramento VARCHAR2(200)
);

CREATE TABLE PESQUISA_MERCADO (
  id_Pesquisa int PRIMARY KEY,
  tipo_Pesquisa VARCHAR2(200),
  descricao_Pesquisa VARCHAR2(200),
  data_Realizacao DATE,
  id_Objetivo INT
);

CREATE TABLE ANALISE_DADOS (
  id_Analise int PRIMARY KEY,
  resultados_Analise VARCHAR2(200),
  id_Estrategia int,
  id_Oportunidade int,
  id_Pesquisa int
);

CREATE TABLE RESULTADO_PESQUISA (
  id_ResultadoPesquisa int PRIMARY KEY,
  id_Analise int,
  id_Monitoramento int
);

ALTER TABLE EMPRESA ADD CONSTRAINT fk_empresa_endereco FOREIGN KEY (id_Endereco) REFERENCES ENDERECO(id_Endereco);

ALTER TABLE CIDADE ADD CONSTRAINT fk_cidade_pais FOREIGN KEY (id_Pais) REFERENCES PAIS(id_Pais);

ALTER TABLE LOGRADOURO ADD CONSTRAINT fk_logradouro_cidade FOREIGN KEY (id_Cidade) REFERENCES CIDADE(id_Cidade);

ALTER TABLE ENDERECO ADD CONSTRAINT fk_endereco_logradouro FOREIGN KEY (id_Logradouro) REFERENCES LOGRADOURO(id_Logradouro);

ALTER TABLE OBJETIVO_EMPRESA ADD FOREIGN KEY (id_Empresa) REFERENCES EMPRESA (id_Empresa);

ALTER TABLE PESQUISA_MERCADO ADD FOREIGN KEY (id_Objetivo) REFERENCES OBJETIVO_EMPRESA (id_Objetivo);

ALTER TABLE ANALISE_DADOS ADD FOREIGN KEY (id_Estrategia) REFERENCES ESTRATEGIAS (id_Estrategia);

ALTER TABLE ANALISE_DADOS ADD FOREIGN KEY (id_Oportunidade) REFERENCES OPORTUNIDADE (id_Oportunidade);

ALTER TABLE ANALISE_DADOS ADD FOREIGN KEY (id_Pesquisa) REFERENCES PESQUISA_MERCADO (id_Pesquisa);

ALTER TABLE RESULTADO_PESQUISA ADD FOREIGN KEY (id_Analise) REFERENCES ANALISE_DADOS (id_Analise);

ALTER TABLE RESULTADO_PESQUISA ADD FOREIGN KEY (id_Monitoramento) REFERENCES MONITORAMENTO (id_Monitoramento);