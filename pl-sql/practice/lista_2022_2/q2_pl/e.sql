/*
Crie uma nova tabela “log_bagagem”, que possui um tipo de ação (VARCHAR) e hora. 
Após isso, crie um Trigger que transfira todas as movimentações que forem feitas
na tabela “bagagem_tb”, para a tabela “log_bagagem”.
*/

DROP TABLE log_bagagem_tb;

CREATE TABLE log_bagagem_tb (
    acao    VARCHAR2 (40),
    hora    TIMESTAMP,

    CONSTRAINT log_bagagem_pkey PRIMARY KEY (acao, hora)
);

CREATE OR REPLACE TRIGGER log_bagagem_tg
AFTER INSERT OR DELETE OR UPDATE ON bagagem_tb
DECLARE
BEGIN
    IF INSERTING THEN
        INSERT INTO LOG_BAGAGEM_TB (acao, hora)
        VALUES ('Inserção    (INSERT)', SYSDATE);
    ELSIF UPDATING THEN
        INSERT INTO LOG_BAGAGEM_TB (acao, hora)
        VALUES ('Atualização (UPDATE)', SYSDATE);
    ELSIF DELETING THEN
        INSERT INTO LOG_BAGAGEM_TB (acao, hora)
        VALUES ('Deleção     (DELETE)', SYSDATE);
    END IF;
END;

SELECT * FROM LOG_BAGAGEM_TB;