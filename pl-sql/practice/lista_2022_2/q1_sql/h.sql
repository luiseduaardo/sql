/*
Realize uma consulta que mostre o número total de aviões que cada companhia aérea possui.
*/

SELECT c.nome, COUNT(*)
FROM AVIAO_TB a
INNER JOIN COMP_AEREA_TB c
ON a.cnpj_cia = c.cnpj
GROUP BY c.nome;