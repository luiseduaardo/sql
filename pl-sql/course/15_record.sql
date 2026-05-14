/*
Em PL, um RECORD (registro) é um grupo de itens armazenados em campos,
cada qual com seu respectivo nome e tipo de dado.

%ROWTYPE
variavel tabela%ROWTYPE;
    - cria uma variável do tipo registro
    - os campos criados na variável tem o mesmo nome e tipo dos atributos de tabela

variavel cursor%ROWTYPE;

*/

SET SERVEROUTPUT ON;
DECLARE
    v_emp   employees%ROWTYPE;
BEGIN
    SELECT * INTO v_emv_emp FROM employees
    WHERE employee_id = 200;

    DBMS_OUTPUT.PUT_LINE(v_emp.first_name || ' ' || v_emp.salary);
    DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_emp   employees%ROWTYPE;
BEGIN
    SELECT first_name, salary, hire_date INTO v_emp.first_name, v_emp.salary, v_emp.hire_date FROM employees
    WHERE employee_id = 200;

    DBMS_OUTPUT.PUT_LINE(v_emp.first_name || ' ' || v_emp.salary);
    DBMS_OUTPUT.PUT_LINE(v_emp.hire_date);
END;
/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR cur (id NUMBER := 105) IS
        SELECT first_name, salary FROM employees
        WHERE employee_id > id;
    
    v_emp   cur%ROWTYPE;

BEGIN
    OPEN cur(193);

    FOR reg IN cur LOOP
        DBMS_OUTPUT.PUT_LINE(reg.first_name || ' ' || reg.salary);
    END LOOP;

    /*
    FETCH cur INTO v_emp;

    WHILE cur%FOUND LOOP
        DBMS_OUTPUT.PUT_LINE(v_emp.first_name || ' ' || v_emp.salary);
        FETCH cur INTO v_emp;
    END LOOP;
    */

    /*
    LOOP
        FETCH cur INTO v_emp;
        EXIT WHEN cur%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(v_emp.first_name || ' ' || v_emp.salary);
    END LOOP;
    */

    CLOSE cur;
END;