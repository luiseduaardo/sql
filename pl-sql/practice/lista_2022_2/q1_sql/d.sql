/*
Realize uma consulta que mostre o nome, cadastro e cargo dos tripulantes 
que são supervisionados.
*/

SELECT p.nome, t.cadastro, t.cargo
FROM tripulante_tb t
INNER JOIN pessoa_tb p
ON p.cpf = t.cpf_pe
WHERE cadastro_supervisor IS NOT NULL;
