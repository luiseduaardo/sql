/*
Registros definidos pelo usuário são variáveis de registro
que tem estrutura definida pelo usuário, ao contrário dos
registros baseados em tabela, em que os campos eram definidos
com base nos atributos da tabela de origem

CREATE TYPE <nome> IS RECORD (
    nome1   tipo1,
    nome2   tipo2
    ...
    nomen   tipon
);

variavel    <nome> -- cria variável com o tipo definido pelo registro

Observação:
quando estamos dentro de um bloco, não é necessário usar o CREATE
porque o tipo fica definido apenas no escopo do bloco local.
Ao fim do bloco, o tipo já é "dropado" automaticamente, sendo
necessário dar DROP TYPE apenas quando definimos um tipo
fora do bloco, já que ele possui escopo global e fica armazenado
no dicionário de dados do BD.
*/

SET SERVEROUTPUT ON;
DECLARE
    TYPE rv_dept IS RECORD (
        f_name  VARCHAR(20),
        d_name  DEPARTMENTS.department_name%TYPE
    );

    var1    rv_dept;

BEGIN
    SELECT fist_name, department_name 
    INTO var1.f_name, var1.d_name
    FROM employees e
    LEFT JOIN departments d
    ON e.department_id = d.department_id
    WHERE employee_id = 100;

    DBMS_OUTPUT.PUT_LINE (var1.f_name || ' ' || var1.d_name);
END;
