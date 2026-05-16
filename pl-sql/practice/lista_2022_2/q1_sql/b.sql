/*
Realize uma consulta que mostre o nome, CPF  e idade dos passageiros que 
possuem a inicial do nome a letra “G”.
*/

SELECT pess.nome, pess.cpf, pess.idade 
FROM PESSOA_TB pess
INNER JOIN PASSAGEIRO_TB pass
ON pess.cpf = pass.cpf_pe
WHERE pess.nome LIKE 'G%'