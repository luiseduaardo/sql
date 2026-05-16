/*
Crie um bloco de código que exibe o nome e o CEP das pessoas, no formato: 
“Raissa Heimann reside no CEP; 2837585”.
*/

DECLARE
    CURSOR pessoas_endereco IS
        SELECT *
        FROM PESSOA_TB p
        INNER JOIN ENDERECO_TB e
        ON p.cpf = e.cpf;
BEGIN
    FOR reg IN pessoas_endereco LOOP
        DBMS_OUTPUT.PUT_LINE(reg.nome || ' reside no CEP ' || reg.cep);
    END LOOP;
END;