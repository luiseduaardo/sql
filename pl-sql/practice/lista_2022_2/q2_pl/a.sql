/*
Crie um procedimento que calcule o peso de todas as bagagens que um passageiro possui.
*/

SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE calcula_bagagem (cpf bagagem_tb.cpf_pa%TYPE) IS
    total_peso  bagagem_tb.peso%TYPE;
BEGIN
    SELECT SUM(peso) INTO total_peso FROM BAGAGEM_TB
    WHERE cpf_pa = cpf;

    DBMS_OUTPUT.PUT_LINE(' CPF ' || cpf);
    DBMS_OUTPUT.PUT_LINE('Peso ' || total_peso);
END calcula_bagagem;
/

EXEC calcula_bagagem('10982770669')