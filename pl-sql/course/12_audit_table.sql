CREATE TABLE Superheroes_Log (
    new_name VARCHAR2 (40),
    old_name VARCHAR2 (40),
    id NUMBER,
    usuario VARCHAR2 (40),
    datetime DATE,
    operation VARCHAR2 (40),

    CONSTRAINT log_pkey PRIMARY KEY (id)
);

CREATE SEQUENCE log_seq
START WITH 1 INCREMENT BY 1;

SET SERVEROUTPUT ON;
CREATE OR REPLACE TRIGGER audit_superheroes
AFTER UPDATE OR INSERT OR DELETE
ON superheroes
FOR EACH ROW
DECLARE
    v_user  Superheroes_Log.usuario%TYPE;
    v_date  Superheroes_Log.datetime%TYPE;
BEGIN
    SELECT user, sysdate INTO v_user, v_date from dual;

    IF INSERTING THEN
        INSERT INTO Superheroes_Log(new_name, old_name, id, usuario, datetime, operation)
        VALUES (:NEW.sh_name, NULL, log_seq.NEXTVAL, v_user, v_date, 'INSERTION');
    ELSIF UPDATING THEN
        INSERT INTO Superheroes_Log(new_name, old_name, id, usuario, datetime, operation)
        VALUES (:NEW.sh_name, :OLD.sh_name, log_seq.NEXTVAL, v_user, v_date, 'UPDATE');
    ELSIF DELETING THEN
        INSERT INTO Superheroes_Log(new_name, old_name, id, usuario, datetime, operation)
        VALUES (NULL, :OLD.sh_name, log_seq.NEXTVAL, v_user, v_date, 'DELETION');
    END IF;
END;
/

INSERT INTO superheroes (sh_name)
VALUES ('Alfred');

UPDATE superheroes
SET sh_name = 'Batman';

DELETE FROM SUPERHEROES
WHERE sh_name = 'Batman';

SELECT * FROM SUPERHEROES_LOG;
