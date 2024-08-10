-- Criação da tabela PEDIDO_NOVOS
CREATE TABLE PEDIDO_NOVOS AS
SELECT * FROM PEDIDO;

-- Adiciona a coluna STATUS na tabela PEDIDO_NOVOS
ALTER TABLE PEDIDO_NOVOS ADD STATUS VARCHAR2(30);

-- Seleciona os dados da tabela PEDIDO_NOVOS para verificação
SELECT * FROM PEDIDO_NOVOS;

-- Trigger para definir STATUS padrão como 'NOVO PEDIDO' antes da inserção
CREATE OR REPLACE TRIGGER trg_pedido
BEFORE INSERT ON PEDIDO_NOVOS
FOR EACH ROW
BEGIN
    IF :NEW.STATUS IS NULL THEN
        :NEW.STATUS := 'NOVO PEDIDO';
    END IF;
END;
/

-- Criação da tabela TB_AUDITORIA
CREATE TABLE TB_AUDITORIA
(
    id NUMBER GENERATED ALWAYS AS IDENTITY,
    tabela VARCHAR2(30),
    operacao VARCHAR2(30),
    data DATE,
    usuario VARCHAR2(30)
);

-- Trigger para auditoria em PEDIDO_NOVOS
CREATE OR REPLACE TRIGGER trg_auditoria
AFTER INSERT OR UPDATE OR DELETE ON PEDIDO_NOVOS
FOR EACH ROW
DECLARE 
    operacao VARCHAR2(30);
    nome_usuario VARCHAR2(30);
BEGIN
    -- Determina a operação realizada
    IF INSERTING THEN
        operacao := 'INSERT';
    ELSIF UPDATING THEN
        operacao := 'UPDATE';
    ELSIF DELETING THEN
        operacao := 'DELETE';
    END IF;
    
    nome_usuario := SYS_CONTEXT('USERENV', 'SESSION_USER');
    
    -- Insere o registro de auditoria na tabela TB_AUDITORIA
    INSERT INTO TB_AUDITORIA (tabela, operacao, data, usuario)
    VALUES ('PEDIDO_NOVOS', operacao, SYSDATE, nome_usuario);
END;
/
