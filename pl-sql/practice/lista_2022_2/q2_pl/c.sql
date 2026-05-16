/*
Crie um bloco de código que exibe quanto cada passageiro pagou em uma passagem, 
no formato: “O cliente de CPF: 12345678990 pagou R$1500.5 com 10% de desconto”.
*/

SET SERVEROUTPUT ON;
DECLARE
    CURSOR passageiro_compra_cursor IS
        SELECT cpf_pa, valor, porcentagem FROM COMPRA_TB;
BEGIN
    FOR reg IN passageiro_compra_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('O cliente de CPF: ' || reg.cpf_pa || ' pagou R$' || reg.valor || ' com ' || reg.porcentagem || '% de desconto');
    END LOOP;
END;