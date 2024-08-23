 -- Removendo tabelas
DROP TABLE USUARIO CASCADE CONSTRAINTS;
DROP TABLE ENDERECO_EMPRESA CASCADE CONSTRAINTS;
DROP TABLE RAMO_EMPRESA CASCADE CONSTRAINTS;
DROP TABLE EMPRESA CASCADE CONSTRAINTS;
DROP TABLE COLABORADOR CASCADE CONSTRAINTS;
DROP TABLE WEBSITES CASCADE CONSTRAINTS;
DROP TABLE TRAFEGO CASCADE CONSTRAINTS;
DROP TABLE ANALISE CASCADE CONSTRAINTS;

-- Tabela USUARIO
CREATE TABLE USUARIO (
  id_Usuario INT PRIMARY KEY,
  nome_Usuario VARCHAR2(200),
  email_Corporativo_Usuario VARCHAR2(200),
  senha_Usuario VARCHAR2(200) -- Suponho que a senha seja armazenada como texto
);

-- Tabela ENDERECO_EMPRESA
CREATE TABLE ENDERECO_EMPRESA (
  id_Endereco INT PRIMARY KEY,
  cep_Endereco CHAR(8), -- Alterei para CHAR
  rua_Endereco VARCHAR2(200),
  num_Endereco INT,
  bairro_Endereco VARCHAR2(200),
  cidade_Endereco VARCHAR2(200),
  estado_Endereco VARCHAR2(200),
  uf_Endereco CHAR(2), -- Alterei para CHAR
  pais_Endereco VARCHAR2(10) -- Corrigi o nome do campo para "pais_Endereco"
);

-- Tabela RAMO_EMPRESA
CREATE TABLE RAMO_EMPRESA (
  id_ramoEmpresa INT PRIMARY KEY,
  nome_ramo VARCHAR2(200),
  desc_ramo VARCHAR2(200)
);

-- Tabela EMPRESA
CREATE TABLE EMPRESA (
  id_Empresa INT PRIMARY KEY,
  nome_Empresa VARCHAR2(200),
  cnpj_Empresa CHAR(14), 
  ramo_AtuacaoEmpresa VARCHAR2(200),
  id_Endereco INT,
  id_ramoEmpresa INT,
  FOREIGN KEY (id_Endereco) REFERENCES ENDERECO_EMPRESA(id_Endereco),
  FOREIGN KEY (id_ramoEmpresa) REFERENCES RAMO_EMPRESA(id_ramoEmpresa)
);

-- Tabela COLABORADOR
CREATE TABLE COLABORADOR (
  id_Colaborador INT PRIMARY KEY,
  id_Usuario INT,
  id_Empresa INT,
  FOREIGN KEY (id_Usuario) REFERENCES USUARIO(id_Usuario),
  FOREIGN KEY (id_Empresa) REFERENCES EMPRESA(id_Empresa)
);

-- Tabela WEBSITES
CREATE TABLE WEBSITES (
  id_Website INT PRIMARY KEY,
  url_Website VARCHAR2(200),
  nome_Website VARCHAR2(200),
  descricao_Website VARCHAR2(200),
  id_Empresa INT,
  FOREIGN KEY (id_Empresa) REFERENCES EMPRESA(id_Empresa)
);

-- Tabela TRAFEGO
CREATE TABLE TRAFEGO (
  id_Trafego INT PRIMARY KEY,
  num_Visitantes NUMBER,
  tempo_MedioVisitaSite TIMESTAMP,
  id_Website INT,
  FOREIGN KEY (id_Website) REFERENCES WEBSITES(id_Website)
);

-- Tabela ANALISE
CREATE TABLE ANALISE (
  id_Analise INT PRIMARY KEY,
  resultados_Analise VARCHAR2(200),
  data_Analise DATE,
  id_Trafego INT,
  FOREIGN KEY (id_Trafego) REFERENCES TRAFEGO(id_Trafego)
);

-- Inserindo dados na tabela USUARIO
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES (1, 'João Silva', 'joao@empresa.com', 'senha123');

-- Inserindo dados na tabela ENDERECO_EMPRESA
INSERT INTO ENDERECO_EMPRESA (id_Endereco, cep_Endereco, rua_Endereco, num_Endereco, bairro_Endereco, cidade_Endereco, estado_Endereco, uf_Endereco, pais_Endereco) 
VALUES (1, '01234567', 'Rua Principal', 123, 'Centro', 'São Paulo', 'SP', 'BR', 'Brasil');

-- Inserindo dados na tabela RAMO_EMPRESA
INSERT INTO RAMO_EMPRESA (id_ramoEmpresa, nome_ramo, desc_ramo) 
VALUES (1, 'Tecnologia', 'Empresa voltada para soluções em tecnologia.');

-- Inserindo dados na tabela EMPRESA
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, cnpj_Empresa, ramo_AtuacaoEmpresa, id_Endereco, id_ramoEmpresa) 
VALUES (1, 'Empresa XYZ', '12345678901234', 'Desenvolvimento de Software', 1, 1);

-- Inserindo dados na tabela COLABORADOR
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES (1, 1, 1);

-- Inserindo dados na tabela WEBSITES
INSERT INTO WEBSITES (id_Website, url_Website, nome_Website, descricao_Website, id_Empresa) 
VALUES (1, 'http://www.empresa.com', 'Empresa Website', 'Website principal da empresa', 1);

-- Inserindo dados na tabela TRAFEGO
INSERT INTO TRAFEGO (id_Trafego, num_Visitantes, tempo_MedioVisitaSite, id_Website) 
VALUES (1, 1000, CURRENT_TIMESTAMP, 1);

-- Inserindo dados na tabela ANALISE
INSERT INTO ANALISE (id_Analise, resultados_Analise, data_Analise, id_Trafego) 
VALUES (1, 'Análise de tráfego do website', TO_DATE('2024-05-17', 'YYYY-MM-DD'), 1);
COMMIT;



select u.*, e.*, ee.*, w.*, r.*, t.*, a.* from USUARIO u
left join COLABORADOR c on c.id_usuario = u.id_usuario
left join EMPRESA e on e.id_empresa = c.id_empresa
left join RAMO_EMPRESA r on r.id_ramoEmpresa = e.id_ramoEmpresa
left join ENDERECO_EMPRESA ee on ee.id_endereco = e.id_endereco
left join WEBSITES w on w.id_empresa = e.id_empresa
left join TRAFEGO t on t.id_Website = w.id_Website
left join ANALISE a on a.id_Trafego = t.id_Trafego;


--SEGUNDA LINHA
-- Inserindo dados na tabela USUARIO
-- Inserindo novos usuários na tabela USUARIO para a Empresa XYZ
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(2, 'Maria Oliveira', 'maria@empresa.com', 'senha456');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(3, 'Pedro Santos', 'pedro@empresa.com', 'senha789');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(4, 'Ana Souza', 'ana@empresa.com', 'senhaabc');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(5, 'Carlos Silva', 'carlos@empresa.com', 'senhadef');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(6, 'Laura Ferreira', 'laura@empresa.com', 'senhaxyz');

-- Vinculando novos usuários da Empresa XYZ às empresas na tabela COLABORADOR
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(2, 2, 1); -- Maria Oliveira na Empresa XYZ
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(3, 3, 1); -- Pedro Santos na Empresa XYZ
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(4, 4, 1); -- Ana Souza na Empresa XYZ
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(5, 5, 1); -- Carlos Silva na Empresa XYZ
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(6, 6, 1); -- Laura Ferreira na Empresa XYZ

-- Inserindo dados na tabela de endereço para outra empresa
INSERT INTO ENDERECO_EMPRESA (id_Endereco, cep_Endereco, rua_Endereco, num_Endereco, bairro_Endereco, cidade_Endereco, estado_Endereco, uf_Endereco, pais_Endereco) 
VALUES (2, '98765432', 'Avenida Central', 456, 'Centro', 'Rio de Janeiro', 'RJ', 'BR', 'Brasil');

-- Inserindo dados na tabela de empresa para outra empresa
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, cnpj_Empresa, ramo_AtuacaoEmpresa, id_Endereco, id_ramoEmpresa) 
VALUES (2, 'Empresa ABC', '98765432109876', 'Desenvolvimento de Aplicativos', 2, 1);

-- Inserindo novos usuários na tabela USUARIO para a Empresa ABC
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(7, 'Patrícia Santos', 'patricia@empresaabc.com', 'senha123');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(8, 'Marcos Oliveira', 'marcos@empresaabc.com', 'senha456');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(9, 'Ana Lima', 'ana@empresaabc.com', 'senha789');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(10, 'Felipe Silva', 'felipe@empresaabc.com', 'senhaabc');
INSERT INTO USUARIO (id_Usuario, nome_Usuario, email_Corporativo_Usuario, senha_Usuario) 
VALUES 
(11, 'Carla Souza', 'carla@empresaabc.com', 'senhaxyz');

-- Vinculando novos usuários da Empresa ABC aos colaboradores na tabela COLABORADOR
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(7, 7, 2); -- Patrícia Santos na Empresa ABC
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(8, 8, 2); -- Marcos Oliveira na Empresa ABC
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(9, 9, 2); -- Ana Lima na Empresa ABC
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(10, 10, 2); -- Felipe Silva na Empresa ABC
INSERT INTO COLABORADOR (id_Colaborador, id_Usuario, id_Empresa) 
VALUES 
(11, 11, 2); -- Carla Souza na Empresa ABC


SET SERVEROUTPUT ON;
EXECUTE gerar_saida_json_db;

CREATE OR REPLACE PROCEDURE gerar_saida_json_db AS

    CURSOR query_bd IS 
        SELECT JSON_OBJECT(
            'id_Usuario' VALUE u.id_Usuario,
            'nome_Usuario' VALUE u.nome_Usuario,
            'email_Corporativo_Usuario' VALUE u.email_Corporativo_Usuario,
            'senha_Usuario' VALUE u.senha_Usuario,
            'empresa' VALUE JSON_OBJECT(
                'id_Empresa' VALUE e.id_Empresa,
                'nome_Empresa' VALUE e.nome_Empresa,
                'cnpj_Empresa' VALUE e.cnpj_Empresa,
                'Ramo Empresa' VALUE JSON_OBJECT(
                    'id_ramoEmpresa' VALUE r.id_ramoEmpresa, 
                    'nome_ramo' VALUE r.nome_ramo, 
                    'desc_ramo' VALUE r.desc_ramo
                ),
                'WebSite' VALUE JSON_OBJECT(
                    'id_Website' VALUE w.id_Website,
                    'url_Website' VALUE w.url_Website,
                    'nome_Website' VALUE w.nome_Website,
                    'descricao_Website' VALUE w.descricao_Website
                ),
                'endereco' VALUE JSON_OBJECT(
                    'cep_Endereco' VALUE ee.cep_Endereco,
                    'rua_Endereco' VALUE ee.rua_Endereco,
                    'num_Endereco' VALUE ee.num_Endereco,
                    'bairro_Endereco' VALUE ee.bairro_Endereco,
                    'cidade_Endereco' VALUE ee.cidade_Endereco,
                    'estado_Endereco' VALUE ee.estado_Endereco,
                    'uf_Endereco' VALUE ee.uf_Endereco,
                    'pais_Endereco' VALUE ee.pais_Endereco,
                    'id_Endereco' VALUE ee.id_Endereco
                )
            ),
            'analise' VALUE JSON_OBJECT(
                'id_Analise' VALUE a.id_Analise,
                'resultados_Analise' VALUE a.resultados_Analise,
                'data_Analise' VALUE a.data_Analise
            ),
            'trafego' VALUE JSON_OBJECT(
                'id_Trafego' VALUE t.id_Trafego,
                'num_Visitantes' VALUE t.num_Visitantes,
                'tempo_MedioVisitaSite' VALUE t.tempo_MedioVisitaSite
            )
        ) AS dados_bd
        FROM USUARIO u
        LEFT JOIN COLABORADOR c ON c.id_usuario = u.id_usuario
        LEFT JOIN EMPRESA e ON e.id_empresa = c.id_empresa
        left join RAMO_EMPRESA r on r.id_ramoEmpresa = e.id_ramoEmpresa
        LEFT JOIN ENDERECO_EMPRESA ee ON ee.id_endereco = e.id_endereco
        LEFT JOIN WEBSITES w ON w.id_empresa = e.id_empresa
        LEFT JOIN TRAFEGO t ON t.id_Website = w.id_Website
        LEFT JOIN ANALISE a ON a.id_Trafego = t.id_Trafego;

    json_output CLOB;
BEGIN
    -- Inicialização do JSON
    json_output := '{' || CHR(10); -- Adiciona quebra de linha

    FOR dados IN query_bd LOOP 
        json_output := json_output || dados.dados_bd || ',' || CHR(10) || ',';
    END LOOP;

    -- Remover a última vírgula e adicionar o fechamento do JSON
    json_output := RTRIM(json_output, ',' || CHR(10)) || CHR(10) || '}';

    -- Imprimir o JSON
    DBMS_OUTPUT.put_line(json_output);
END;
/