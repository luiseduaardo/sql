/*
Em PL/SQL temos dois tipos de subrotinas/subprogramas:
- Funções
- Procedimentos/procedures

Funções são blocos nomeados que são armazenados na base
de dados e contém instruções para tarefas pré definidas
(conceito análogo à linguagens de programação normais).
*/

/*
CREATE OR REPLACE FUNCTION <nome>
(parametro1, parametro2...) RETURN <datatype> IS
DECLARE
    declaração de variáveis, constantes, cursores, etc.
BEGIN
    statements executáveis...

    return (var);
END <nome>;
*/

CREATE OR REPLACE FUNCTION circle_area (radius NUMBER)
RETURN NUMBER IS
    pi  CONSTANT NUMBER(7,3) := 3.141;
    ar  NUMBER(7,3);
BEGIN
    ar := pi * (radius * radius);

    RETURN ar;
END circle_area;
/

SET SERVEROUTPUT ON;
DECLARE
    vr_area     circle_area.ar%TYPE;

BEGIN
    vr_area := circle_area(25);
    DBMS_OUTPUT.PUT_LINE(vr_area);
END;
/