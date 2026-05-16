/*
Crie um bloco de código que exibe o nome, CPF e o número de cadastro 
de cada tripulante, no formato: “O tripulante Eduardo Conti de CPF: 
123456789-90 possui o cadastro de número 12”.
*/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR trip IS
        SELECT p.nome, p.cpf, t.cadastro FROM TRIPULANTE_TB t
        LEFT JOIN PESSOA_TB p
        ON p.cpf = t.cpf_pe;
BEGIN
    -- OPEN trip; (não usa open porque o loop for já realiza essa operação)

    FOR reg IN trip LOOP
        DBMS_OUTPUT.PUT_LINE('O tripulante ' || reg.nome || ' de CPF: ' || reg.cpf || ' possui o cadastro de número ' || reg.cadastro);
    END LOOP;

    -- CLOSE trip; (da mesma forma, não precisa do close porque o loop for já fecha ao fim das iterações)
END;