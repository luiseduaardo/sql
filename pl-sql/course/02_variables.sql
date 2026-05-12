-- variables
    -- placeholder in memory that hold some data
    -- valid name, data tipe, width

SET SERVEROUTPUT ON;
DECLARE
    v_test  VARCHAR2(15);
BEGIN
    v_test := 'hello, world';
        -- := é o operador de atribuição
        -- podemos usar o atributo de atribuição em qualquer parte do bloco
    DBMS_OUTPUT.PUT_LINE(v_test);
END;
/