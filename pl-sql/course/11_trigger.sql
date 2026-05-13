CREATE TABLE superheroes (
    sh_name VARCHAR2 (20)
);

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER print_message
BEFORE INSERT OR DELETE OR UPDATE
ON superheroes
FOR EACH ROW
DECLARE
    v_user  VARCHAR2 (20);
BEGIN
    SELECT user INTO v_user FROM dual;

    IF INSERTING THEN
        DBMS_OUTPUT.PUT_LINE('O usuário ' || v_user || ' inseriu uma nova linha.');
    ELSIF UPDATING THEN
        DBMS_OUTPUT.PUT_LINE('O usuário ' || v_user || ' atualizou uma linha.');
    ELSIF DELETING THEN
        DBMS_OUTPUT.PUT_LINE('O usuário ' || v_user || ' deletou uma linha.');
    END IF;
END;