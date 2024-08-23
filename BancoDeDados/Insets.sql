-- Inserts para a tabela PAIS
INSERT INTO PAIS (id_Pais, nome_Pais) VALUES (1, 'Brasil');
INSERT INTO PAIS (id_Pais, nome_Pais) VALUES (2, 'Estados Unidos');
INSERT INTO PAIS (id_Pais, nome_Pais) VALUES (3, 'Fran�a');
INSERT INTO PAIS (id_Pais, nome_Pais) VALUES (4, 'Jap�o');
INSERT INTO PAIS (id_Pais, nome_Pais) VALUES (5, 'Alemanha');

-- Inserts para a tabela CIDADE
INSERT INTO CIDADE (id_Cidade, nome_Cidade, id_Pais) VALUES (1, 'Rio de Janeiro', 1);
INSERT INTO CIDADE (id_Cidade, nome_Cidade, id_Pais) VALUES (2, 'Nova York', 2);
INSERT INTO CIDADE (id_Cidade, nome_Cidade, id_Pais) VALUES (3, 'Paris', 3);
INSERT INTO CIDADE (id_Cidade, nome_Cidade, id_Pais) VALUES (4, 'T�quio', 4);
INSERT INTO CIDADE (id_Cidade, nome_Cidade, id_Pais) VALUES (5, 'Berlim', 5);

-- Inserts para a tabela LOGRADOURO
INSERT INTO LOGRADOURO (id_Logradouro, nome_Logradouro, id_Cidade) VALUES (1, 'Avenida Brasil', 1);
INSERT INTO LOGRADOURO (id_Logradouro, nome_Logradouro, id_Cidade) VALUES (2, 'Broadway', 2);
INSERT INTO LOGRADOURO (id_Logradouro, nome_Logradouro, id_Cidade) VALUES (3, 'Champs', 3);
INSERT INTO LOGRADOURO (id_Logradouro, nome_Logradouro, id_Cidade) VALUES (4, 'Shibuya Crossing', 4);
INSERT INTO LOGRADOURO (id_Logradouro, nome_Logradouro, id_Cidade) VALUES (5, 'Unter den Linden', 5);

-- Inserts para a tabela ENDERECO
INSERT INTO ENDERECO (id_Endereco, numero, complemento, cep, id_Logradouro) VALUES (1, 100, 'Apartamento 101', '20000-000', 1);
INSERT INTO ENDERECO (id_Endereco, numero, complemento, cep, id_Logradouro) VALUES (2, 500, 'Piso 10', '10001', 2);
INSERT INTO ENDERECO (id_Endereco, numero, complemento, cep, id_Logradouro) VALUES (3, 25, NULL, '75008', 3);
INSERT INTO ENDERECO (id_Endereco, numero, complemento, cep, id_Logradouro) VALUES (4, 1, 'Loja 101', '150-0042', 4);
INSERT INTO ENDERECO (id_Endereco, numero, complemento, cep, id_Logradouro) VALUES (5, 50, NULL, '10117', 5);

-- Inserts para a tabela EMPRESA
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, setor_Atuacao, email_empresa, id_Endereco) VALUES (1, 'Empresa A', 'Tecnologia','empresa_a@example.com', 1);
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, setor_Atuacao, email_empresa, id_Endereco) VALUES (2, 'Empresa B', 'Sa�de', 'empresa_b@example.com', 2);
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, setor_Atuacao, email_empresa, id_Endereco) VALUES (3, 'Empresa C', 'educa��o', 'empresa_c@example.com', 3);
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, setor_Atuacao, email_empresa, id_Endereco) VALUES (4, 'Empresa D', 'Financeiro', 'empresa_d@example.com', 4);
INSERT INTO EMPRESA (id_Empresa, nome_Empresa, setor_Atuacao, email_empresa, id_Endereco) VALUES (5, 'Empresa E', 'Tecnologia', 'empresa_e@example.com', 5);

-- Inserts para a tabela OBJETIVO_EMPRESA
INSERT INTO OBJETIVO_EMPRESA (id_Objetivo, descricao_Objetivo, id_Empresa) VALUES (1, 'Expandir para mercados internacionais', 1);
INSERT INTO OBJETIVO_EMPRESA (id_Objetivo, descricao_Objetivo, id_Empresa) VALUES (2, 'Desenvolver novos produtos', 2);
INSERT INTO OBJETIVO_EMPRESA (id_Objetivo, descricao_Objetivo, id_Empresa) VALUES (3, 'Melhorar a efici�ncia operacional', 3);
INSERT INTO OBJETIVO_EMPRESA (id_Objetivo, descricao_Objetivo, id_Empresa) VALUES (4, 'Aumentar a base de clientes', 4);
INSERT INTO OBJETIVO_EMPRESA (id_Objetivo, descricao_Objetivo, id_Empresa) VALUES (5, 'Inovar em tecnologia', 5);

-- Inserts para a tabela OPORTUNIDADE
INSERT INTO OPORTUNIDADE (id_Oportunidade, descricao_Oportunidade) VALUES (1, 'Desenvolver um novo produto para o mercado de Sa�de');
INSERT INTO OPORTUNIDADE (id_Oportunidade, descricao_Oportunidade) VALUES (2, 'Expandir a presen�a internacional da empresa');
INSERT INTO OPORTUNIDADE (id_Oportunidade, descricao_Oportunidade) VALUES (3, 'Melhorar a efici�ncia operacional da produ��o');
INSERT INTO OPORTUNIDADE (id_Oportunidade, descricao_Oportunidade) VALUES (4, 'Explorar parcerias estrat�gicas com outras empresas');
INSERT INTO OPORTUNIDADE (id_Oportunidade, descricao_Oportunidade) VALUES (5, 'Inovar nos processos de entrega e log�stica');

-- Inserts para a tabela ESTRATEGIAS
INSERT INTO ESTRATEGIAS (id_Estrategia, descricao_Estrategia) VALUES (1, 'Investir em pesquisa e desenvolvimento para o novo produto');
INSERT INTO ESTRATEGIAS (id_Estrategia, descricao_Estrategia) VALUES (2, 'Contratar consultoria especializada para expans�o internacional');
INSERT INTO ESTRATEGIAS (id_Estrategia, descricao_Estrategia) VALUES (3, 'Implementar programas de melhoria cont�nua na produ��o');
INSERT INTO ESTRATEGIAS (id_Estrategia, descricao_Estrategia) VALUES (4, 'Identificar e negociar parcerias estrat�gicas');
INSERT INTO ESTRATEGIAS (id_Estrategia, descricao_Estrategia) VALUES (5, 'Investir em tecnologias de automatiza��o e otimiza��o de processos');

-- Inserts para a tabela MONITORAMENTO
INSERT INTO MONITORAMENTO (id_Monitoramento, descricao_Monitoramento, resultados_Monitoramento) VALUES (1, 'Monitorar o feedback dos clientes', 'Aumento na satisfa��o do cliente em 20% para implementa��o');
INSERT INTO MONITORAMENTO (id_Monitoramento, descricao_Monitoramento, resultados_Monitoramento) VALUES (2, 'Acompanhar os indicadores de desempenho', 'redu��o de custos operacionais em 15% no primeiro trimestre');
INSERT INTO MONITORAMENTO (id_Monitoramento, descricao_Monitoramento, resultados_Monitoramento) VALUES (3, 'Realizar an�lises de mercado', 'indetificar de novas oportunidades de mercado');
INSERT INTO MONITORAMENTO (id_Monitoramento, descricao_Monitoramento, resultados_Monitoramento) VALUES (4, 'Avaliar o progresso das parcerias estrat�gicas', 'Fortalecimento das rela��es com parceiros-chave');
INSERT INTO MONITORAMENTO (id_Monitoramento, descricao_Monitoramento, resultados_Monitoramento) VALUES (5, 'Auditar os processos de produ��o regularmente', 'Melhoria na efici�ncia da linha de produ��o');

-- Inserts para a tabela PESQUISA_MERCADO
INSERT INTO PESQUISA_MERCADO (id_Pesquisa, tipo_Pesquisa, descricao_Pesquisa, data_Realizacao, id_Objetivo) VALUES (1, 'Pesquisa de Mercado', 'An�lise do mercado de sa�de na Am�rica Latina', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 1);
INSERT INTO PESQUISA_MERCADO (id_Pesquisa, tipo_Pesquisa, descricao_Pesquisa, data_Realizacao, id_Objetivo) VALUES (2, 'Pesquisa de Consumidor', 'Avalia��o das prefer�ncias dos consumidores de tecnologia', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 2);
INSERT INTO PESQUISA_MERCADO (id_Pesquisa, tipo_Pesquisa, descricao_Pesquisa, data_Realizacao, id_Objetivo) VALUES (3, 'Estudo de Mercado', 'An�lise da concorr�ncia no setor financeiro', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 3);
INSERT INTO PESQUISA_MERCADO (id_Pesquisa, tipo_Pesquisa, descricao_Pesquisa, data_Realizacao, id_Objetivo) VALUES (4, 'Pesquisa de Opini�o', 'Levantamento de opini�es sobre produtos educacionais', TO_DATE('2024-01-25', 'YYYY-MM-DD'), 4);
INSERT INTO PESQUISA_MERCADO (id_Pesquisa, tipo_Pesquisa, descricao_Pesquisa, data_Realizacao, id_Objetivo) VALUES (5, 'Estudo de Mercado', 'An�lise de tend�ncias no mercado de tecnologia', TO_DATE('2024-03-05', 'YYYY-MM-DD'), 5);

-- Inserts para a tabela ANALISE_DADOS
INSERT INTO ANALISE_DADOS (id_Analise, resultados_Analise, id_Estrategia, id_Oportunidade, id_Pesquisa) VALUES (1, 'Identifica��o de potenciais parceiros na regi�o', 4, 2, 1);
INSERT INTO ANALISE_DADOS (id_Analise, resultados_Analise, id_Estrategia, id_Oportunidade, id_Pesquisa) VALUES (2, 'Identifica��o de oportunidades de expans�o', 2, 1, 2);
INSERT INTO ANALISE_DADOS (id_Analise, resultados_Analise, id_Estrategia, id_Oportunidade, id_Pesquisa) VALUES (3, 'An�lise comparativa de produtos financeiros', 5, 3, 3);
INSERT INTO ANALISE_DADOS (id_Analise, resultados_Analise, id_Estrategia, id_Oportunidade, id_Pesquisa) VALUES (4, 'Levantamento das prefer�ncias dos consumidores', 3, 4, 4);
INSERT INTO ANALISE_DADOS (id_Analise, resultados_Analise, id_Estrategia, id_Oportunidade, id_Pesquisa) VALUES (5, 'Identifica��o de novas tend�ncias tecnol�gicas', 1, 5, 5);

-- Inserts para a tabela RESULTADO_PESQUISA
INSERT INTO RESULTADO_PESQUISA (id_ResultadoPesquisa, id_Analise, id_Monitoramento) VALUES (1, 1, 1);
INSERT INTO RESULTADO_PESQUISA (id_ResultadoPesquisa, id_Analise, id_Monitoramento) VALUES (2, 2, 2);
INSERT INTO RESULTADO_PESQUISA (id_ResultadoPesquisa, id_Analise, id_Monitoramento) VALUES (3, 3, 3);
INSERT INTO RESULTADO_PESQUISA (id_ResultadoPesquisa, id_Analise, id_Monitoramento) VALUES (4, 4, 4);
INSERT INTO RESULTADO_PESQUISA (id_ResultadoPesquisa, id_Analise, id_Monitoramento) VALUES (5, 5, 5);

COMMIT;