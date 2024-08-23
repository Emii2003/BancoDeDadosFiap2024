-- Bloco anônimo com 3 consultas de junção
DECLARE
  -- Variáveis para armazenar os resultados das consultas
  v_nome_empresa EMPRESA.nome_Empresa%TYPE;
  v_descricao_objetivo OBJETIVO_EMPRESA.descricao_Objetivo%TYPE;
  v_descricao_oportunidade OPORTUNIDADE.descricao_Oportunidade%TYPE;
  v_descricao_estrategia ESTRATEGIAS.descricao_Estrategia%TYPE;
  v_descricao_pesquisa PESQUISA_MERCADO.descricao_Pesquisa%TYPE;
  v_resultados_monitoramento MONITORAMENTO.resultados_Monitoramento%TYPE;
BEGIN
  -- Consulta 1: Empresas e seus objetivos
  FOR emp IN (SELECT E.nome_Empresa, OE.descricao_Objetivo
              FROM EMPRESA E
              INNER JOIN OBJETIVO_EMPRESA OE ON E.id_Empresa = OE.id_Empresa
              ORDER BY E.nome_Empresa)
  LOOP
    v_nome_empresa := emp.nome_Empresa;
    v_descricao_objetivo := emp.descricao_Objetivo;
    DBMS_OUTPUT.PUT_LINE('Empresa: ' || v_nome_empresa || ', Objetivo: ' || v_descricao_objetivo);
  END LOOP;

  -- Consulta 2: Oportunidades e suas estratégias
  FOR oportunidade IN (SELECT O.descricao_Oportunidade, ES.descricao_Estrategia
                       FROM OPORTUNIDADE O
                       INNER JOIN ANALISE_DADOS AD ON O.id_Oportunidade = AD.id_Oportunidade
                       INNER JOIN ESTRATEGIAS ES ON AD.id_Estrategia = ES.id_Estrategia
                       ORDER BY O.descricao_Oportunidade)
  LOOP
    v_descricao_oportunidade := oportunidade.descricao_Oportunidade;
    v_descricao_estrategia := oportunidade.descricao_Estrategia;
    DBMS_OUTPUT.PUT_LINE('Oportunidade: ' || v_descricao_oportunidade || ', Estratégia: ' || v_descricao_estrategia);
  END LOOP;

  -- Consulta 3: Pesquisas de mercado com resultados de monitoramento
  FOR pesquisa IN (SELECT PM.descricao_Pesquisa, M.resultados_Monitoramento
                   FROM PESQUISA_MERCADO PM
                   INNER JOIN ANALISE_DADOS AD ON PM.id_Pesquisa = AD.id_Pesquisa
                   INNER JOIN RESULTADO_PESQUISA RP ON AD.id_Analise = RP.id_Analise
                   INNER JOIN MONITORAMENTO M ON RP.id_Monitoramento = M.id_Monitoramento
                   ORDER BY PM.descricao_Pesquisa)
  LOOP
    v_descricao_pesquisa := pesquisa.descricao_Pesquisa;
    v_resultados_monitoramento := pesquisa.resultados_Monitoramento;
    DBMS_OUTPUT.PUT_LINE('Pesquisa de mercado: ' || v_descricao_pesquisa || ', Resultados de monitoramento: ' || v_resultados_monitoramento);
  END LOOP;
END;

DECLARE
  CURSOR c IS
    SELECT E.nome_Empresa, OE.descricao_Objetivo
    FROM EMPRESA E
    LEFT JOIN OBJETIVO_EMPRESA OE ON E.id_Empresa = OE.id_Empresa
    ORDER BY E.nome_Empresa;

  CURSOR c2 IS
    SELECT O.descricao_Oportunidade, ES.descricao_Estrategia
    FROM OPORTUNIDADE O
    INNER JOIN ANALISE_DADOS AD ON O.id_Oportunidade = AD.id_Oportunidade
    INNER JOIN ESTRATEGIAS ES ON AD.id_Estrategia = ES.id_Estrategia
    ORDER BY O.descricao_Oportunidade;

  CURSOR c3 IS
    SELECT PM.descricao_Pesquisa, M.resultados_Monitoramento
    FROM PESQUISA_MERCADO PM
    INNER JOIN ANALISE_DADOS AD ON PM.id_Pesquisa = AD.id_Pesquisa
    INNER JOIN RESULTADO_PESQUISA RP ON AD.id_Analise = RP.id_Analise
    INNER JOIN MONITORAMENTO M ON RP.id_Monitoramento = M.id_Monitoramento
    ORDER BY PM.descricao_Pesquisa;
BEGIN
  -- Consulta 1: Empresas e seus objetivos
  FOR emp IN c LOOP
    DBMS_OUTPUT.PUT_LINE('Empresa: ' || emp.nome_Empresa || ', Objetivo: ' || emp.descricao_Objetivo);
  END LOOP;

  -- Consulta 2: Oportunidades e suas estratégias
  FOR oportunidade IN c2 LOOP
    DBMS_OUTPUT.PUT_LINE('Oportunidade: ' || oportunidade.descricao_Oportunidade || ', Estratégia: ' || oportunidade.descricao_Estrategia);
  END LOOP;

  -- Consulta 3: Pesquisas de mercado com resultados de monitoramento
  FOR pesquisa IN c3 LOOP
    DBMS_OUTPUT.PUT_LINE('Pesquisa de mercado: ' || pesquisa.descricao_Pesquisa || ', Resultados de monitoramento: ' || pesquisa.resultados_Monitoramento);
  END LOOP;
END;
