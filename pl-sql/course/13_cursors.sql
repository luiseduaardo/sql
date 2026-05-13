-- Cursores são usados para processar várias linhas obtidas a partir de uma consulta
    -- Podem ser explícitos ou implícitos

/*
FLUXO DO CURSOR
                                                        -----------------------------
                                                        |                            | N
DECLARE  -->          OPEN           --->            FETCH                  ---->  VAZIO?
(cria)           (abre o cursor             (carrega linha na variável)              | S
               / realiza consulta)                                                 CLOSE
*/

/*
DECLARE
    ...

    CURSOR <nome> IS
        SELECT ...
BEGIN
    OPEN <nome>;

    FETCH <nome> INTO <lista_de_variáveis;
    FETCH <nome> INTO <registro>;            -- pode ser obtido a partir de uma variável %ROWTYPE

    CLOSE <nome>;
END;
*/

/*
PROPRIEDADES DE CURSORES
    - cursor%rowcount   - Quantidade de tuplas recuperadas pela consulta
    - cursor%found      - TRUE caso alguma tupla tenha sido recuperada
    - cursor%notfound   - TRUE caso alguma tupla não tenha sido recuperada
    - cursor%isopen     - TRUE caso o cursor esteja aberto
*/

SET SERVEROUTPUT ON;
DECLARE
    v_name VARCHAR2 (30);

    CURSOR cur IS
        SELECT first_name FROM employees
        WHERE employee_id < 105;

BEGIN
    OPEN cur;

    /*
    FETCH cur INTO v_name;

    WHILE v_name%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_name);

        FETCH cur INTO v_name;
    END LOOP;
    */

    LOOP
        FETCH cur INTO v_name;
        DBMS_OUTPUT.PUT_LINE(v_name);
        EXIT WHEN cur%NOTFOUND;
    END LOOP;

    CLOSE cur;
END;
/

/* CURSOR PARAMETERS */

SET SERVEROUTPUT ON;
DECLARE
    v_name  VARCHAR2(30);

    CURSOR p_cur (var_e_id VARCHAR2) IS
        SELECT first_name FROM employees
        WHERE employee_id < var_e_id;

BEGIN
    OPEN p_cur(105);         -- executa a consulta do cursor com base no valor passado no open

    FETCH cur INTO v_name;

    WHILE cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_name);

        FETCH cur INTO v_name;
    END LOOP;

    CLOSE p_cur;

    --

    OPEN p_cur(50); -- permite uma maior flexibilidade no uso do cursor

    FETCH cur INTO v_name;

    WHILE cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_name);

        FETCH cur INTO v_name;
    END LOOP;

    CLOSE p_cur;

END;
/

SET SERVEROUTPUT ON;
DECLARE  
    CURSOR dval_cur (var_e_id NUMBER := 105) IS
        SELECT first_name, employee_id FROM employees
        WHERE employee_id > var_e_id;

    v_name  dval_cur%ROWTYPE;

BEGIN
    OPEN dval_cur;  -- executa com valor default definido na passagem de parâmetro do cursor

    FETCH d_val_cur INTO v_name;

    WHILE dval_cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_name);

        FETCH d_val_cur INTO v_name;
    END LOOP;

    CLOSE dval_cur;

    --

    OPEN dval_cur(50); -- executa com o valor passado agora na passagem de parâmetro

    FETCH d_val_cur INTO v_name;

    WHILE dval_cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_name.first_name || ' ' || v_name.employee_id);

        FETCH d_val_cur INTO v_name;
    END LOOP;

    CLOSE dval_cur;
END;