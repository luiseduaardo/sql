DECLARE
    v_salary    NUMBER(8);
BEGIN
    SELECT salary INTO v_salary FROM employees
    WHERE employee_id = 100;
        -- o atributo salary deve ser do mesmo tipo que v_salary para que funcione corretamente
        -- usamos para armazenar apenas um atributo
END;
/

DECLARE
    v_salary    NUMBER(8);
    v_fname     VARCHAR2(20);
BEGIN
    SELECT salary, first_name INTO v_salary, v_fname FROM employees
    WHERE employee_id = 100;
END;
/