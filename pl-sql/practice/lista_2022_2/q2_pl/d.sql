/*
Crie um Trigger que impeça que o salário de um tripulante seja reduzido.
*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER salario_tripulante
BEFORE UPDATE ON tripulante_tb
FOR EACH ROW
BEGIN
    IF :NEW.salario < :OLD.salario THEN
        RAISE_APPLICATION_ERROR(-20001, 'O salário do tripulante não pode ser reduzido.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Salário atualizado de R$' || :OLD.salario || ' para R$' || :NEW.salario);
    END IF;
END;
/