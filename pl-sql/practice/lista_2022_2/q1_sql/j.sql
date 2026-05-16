/*
Realize uma consulta que mostre todos os funcionários que possuem o salário 
maior que todos os funcionários da Gol.
*/

SELECT p.nome, t.cpf_pe
FROM TRIPULANTE_TB t, PESSOA_TB p
WHERE salario >
ALL (
    SELECT salario FROM TRIPULANTE_TB tri
    INNER JOIN TRABALHA_TB tra ON tri.cpf_pe = tra.cpf_tri
    INNER JOIN COMP_AEREA_TB c ON c.cnpj = tra.CNPJ_CIA
    WHERE c.nome = 'Gol Airlines')
AND t.cpf_pe = p.cpf;