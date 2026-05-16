/*
Crie um procedimento que recebe um CPF e busca o mesmo na tabela de pessoas. 
Caso o CPF exista no banco de dados, imprima: 

“Nome: Romulo Daniell
Idade: 19
CPF: 18274690534”

Caso o contrário, imprima:
“Essa pessoa não está registrada no nosso banco de dados.”
*/

CREATE OR REPLACE PROCEDURE verifica_cpf (cpf_recebido pessoa_tb.cpf%TYPE) IS
    registro pessoa_tb%ROWTYPE;
BEGIN
    SELECT * INTO registro FROM pessoa_tb p WHERE p.cpf = cpf_recebido;
    
    DBMS_OUTPUT.PUT_LINE('Nome : ' || registro.nome);
    DBMS_OUTPUT.PUT_LINE('Idade: ' || registro.idade);
    DBMS_OUTPUT.PUT_LINE('CPF  : ' || registro.cpf);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE ('Essa pessoa não está registrada no nosso banco de dados.');
END verifica_cpf;
