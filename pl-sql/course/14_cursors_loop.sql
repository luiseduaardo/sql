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