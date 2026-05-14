/*
Tabelas/tables são estruturas virtuais existentes somente 
durante o tempo de execução de um programa PL.
Atuam como vetores/arrays dinâmicos que são acessados por
índices definidos na declaração da tabela.
Não podem ser acessadas por meio de SELECT ou INSERT.
*/

SET SERVEROUTPUT ON;
DECLARE
    TYPE rv_dept IS RECORD (
        f_name  VARCHAR(20),
        d_name  DEPARTMENTS.department_name%TYPE
    );

    TYPE func_tb IS TABLE OF rv_dept
    INDEX BY BINARY_INTEGER;

    v_tab_funcionarios func_tb;
    v_indice BINARY_INTEGER := 0;

    CURSOR c_dados IS
        SELECT e.first_name, d.department_name
        FROM employees e
        JOIN departments d
        ON e.department_id = d.department_id;

BEGIN
    OPEN c_dados;

    FOR r_linha IN c_dados LOOP
        v_indice := v_indice + 1;
        v_tab_funcionarios(v_indice).f_name := r_linha.first_name;
        v_tab_funcionarios(v_indice).d_name := r_linha.department_name;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Lista de funcionários:');
    FOR i IN 1..v_tab_funcionarios.COUNT LOOP
        DBMS_OUTPUT.PUT_LINE(v_tab_funcionarios(i).f_name || v_tab_funcionarios(i).d_name);
    END LOOP;

    CLOSE c_dados;
END;