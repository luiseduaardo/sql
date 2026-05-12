-- achored datatype
    -- variable-name table.typed-attribute%type

/*
Students

Name        Type
STU_ID      NUMBER(2)
FIRST_NAME  VARCHAR2(8)

SELECT * FROM STUDENTS;

STU_ID  FIRST_NAME
    1   Clark
    2   Tony
*/

DECLARE
    v_fname STUDENT.first_name%TYPE; 
        -- v_fname tem tipo VARCHAR2 (8)
        -- faz sentido usar. caso seja necessário mudar o tipo do meu atributo em algum momento posterior, o script PL se mantém atualizado.
BEGIN
    SELECT first_name INTO v_fname FROM STUDENT
    WHERE stu_id = 1;
        -- v_fname := 'Clark';
END;
/