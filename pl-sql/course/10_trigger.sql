-- triggers
    -- trigger é um gatilho que é disparado automaticamente quando ocorre um evento
    -- uma trigger DML é disparado quando um comando de INSERT, DELETE ou UPDATE é executado sobre uma tabela ou view


/*
CREATE [OR REPLACE] TRIGGER <nome>
{BEFORE/AFTER/INSTEAD OF} <evento> ]
ON <tabela>
[FOR EACH ROW] -- caso seja uma trigger de linha
[ENABLE/DISABLE] [WHEN condição]
DECLARE
    declaração...
BEGIN
    codigo...
END;
/
*/

-- trigger de comando: executado uma única vez para todo o comando
    -- bom para fazer operações que envolvam logs de auditoria ou revoga permissões gerais temporárias porque faz uma execução para a tabela toda
CREATE OR REPLACE TRIGGER tg_employees_dias
AFTER INSERT OR DELETE OR UPDATE 
ON EMPLOYEES
BEGIN
    IF TRIM(TO_CHAR(sysdate, 'DAY')) IN ('SÁBADO', 'DOMINGO', 'SEGUNDA-FEIRA') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Não é possível fazer alterações no Sábado, Domingo ou Segunda-Feira.');
    END IF;
END;
/

ALTER TRIGGER tg_employees_dias ENABLE;     -- habilita a trigger que estava desabilitada
ALTER TRIGGER tg_employees_dias DISABLE;    -- desabilita a trigger que estava habilitada
DROP TRIGGER tg_employees_dias;             -- exclui totalmente a trigger

-- trigger de linha: executa uma vez para cada registro que for afetado por comandos de INSERT/UPDATE/DELETE
    -- bom para fazer operações de alteração de registros porque não precisa acessar a tabela toda para alterar somente um registro
    -- permite o uso de :NEW (referencia novos valores) e :OLD (referencia valores antigos)
CREATE OR REPLACE TRIGGER update_carro
AFTER UPDATE
ON locacao
FOR EACH ROW
BEGIN
    IF :NEW.data_entrega IS NOT NULL THEN
        UPDATE carro
        SET km_carro = :NEW.km_final
        WHERE chassi = :NEW.chassi;
    END IF;
END;
/