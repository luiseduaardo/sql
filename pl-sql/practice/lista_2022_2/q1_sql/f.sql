/*
Realize uma consulta que mostre todos os dados dos tripulantes que são comissários.
*/

SELECT *
FROM PESSOA_TB p
LEFT JOIN TRIPULANTE_TB t
ON t.cpf_pe = p.cpf
WHERE t.cargo = 'Comissário';