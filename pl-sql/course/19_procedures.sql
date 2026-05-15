/*
Um stored procedure é um subprograma criado para executar
tarefas específicas, assim como funções e que podem ser
reutilizadas.

A diferença para as funções é que um stored procedure
não retorna nenhum valor.
*/

/*
CREATE OR REPLACE PROCEDURE <name>
(parametro1, parametro2...) IS
    statements para serem declarados...
BEGIN
    statements executáveis...
END <name>;
*/

-- Sem parâmetros

CREATE OR REPLACE PROCEDURE pr_sample IS
    var_name    VARCHAR2 (20) := 'Steve';
    var_web     VARCHAR2 (20) := 'apple.com';
BEGIN
    DBMS_OUTPUT.PUT_LINE(var_name || ' works at ' || var_web);
END pr_sample;
/

SET SERVEROUTPUT ON;
EXECUTE pr_sample;
EXEC pr_sample;
BEGIN
    pr_sample;
END;
/

-- Com parâmetros
CREATE OR REPLACE PROCEDURE emp_sal 
(dep_id NUMBER, sal_rai NUMBER) IS
BEGIN
    UPDATE employees
    SET salary = salary * (1 + (sal_rai/100))
    WHERE department_id = dep_id;
END;
/

-- aumenta o salário dos funcionários do departamento
-- 101 em 12%
EXEC emp_sal(101, 12);