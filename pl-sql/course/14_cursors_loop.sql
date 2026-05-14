SET SERVEROUTPUT ON;
DECLARE
    CURSOR cur IS
        SELECT first_name, last_name FROM employees
        WHERE employee_id > 200;

BEGIN
    OPEN cur;

    FOR l_idx IN cur LOOP
        DBMS_OUTPUT.PUT_LINE(l_idx.first_name || ' ' || l_idx.last_name);
    END LOOP;

    CLOSE cur;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR cur (var_e_id NUMBER := 105) IS
        SELECT employee_id, first_name FROM employees
        WHERE employee_id > var_e_id;

BEGIN
    OPEN cur;

    FOR f_idx IN cur LOOP
        DBMS_OUTPUT.PUT_LINE(f_idx.first_name || ' - ' || f_idx.employee_id);
    END LOOP;

    FOR f_idx IN cur(200) LOOP
        DBMS_OUTPUT.PUT_LINE(f_idx.first_name || ' - ' || f_idx.employee_id);
    END LOOP;

    CLOSE CUR;
END;
/