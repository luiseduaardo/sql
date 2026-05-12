-- mesmo esquema de nomeação de variáveis, apenas adiciona:
    -- CONSTANT antes do tipo + atribui valor
    -- constant-name CONSTANT datatype (width) := value;

    -- DEFAULT depois do tipo + valor default
    -- variable-name datatype value;

    -- DEFAULT EVITA QUE ATRIBUIR VALORES NULOS E SUBSTITUI O OPERADOR DE :=

SET SERVEROUTPUT ON;
DECLARE
    v_p1    CONSTANT NUMBER(7,6) := 3.141592;
    v_p2    BOOLEAN DEFAULT TRUE;
    v_p3    CONSTANT NUMBER(7,6) DEFAULT 3.141592;
BEGIN
    DBMS_OUTPUT.PUT_LINE(v_p1);
    DBMS_OUTPUT.PUT_LINE(CASE WHEN v_p2 THEN 'TRUE' ELSE 'FALSE' END);
END;