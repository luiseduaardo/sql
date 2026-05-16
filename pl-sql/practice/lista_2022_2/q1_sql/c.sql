/*
Realize uma consulta que mostre a maior porcentagem de desconto, assim 
como o ID da compra, e o nome do passageiro.
*/

SELECT c.id_compra, c.porcentagem, p.nome
FROM COMPRA_TB c
INNER JOIN PESSOA_TB p
ON p.cpf = c.cpf_pa
ORDER BY PORCENTAGEM DESC
FETCH FIRST 1 ROW ONLY;

SELECT c.id_compra, c.porcentagem, p.nome
FROM compra_tb c
INNER JOIN pessoa_tb p
ON c.cpf_pa = p.cpf
WHERE porcentagem IN ( SELECT MAX(porcentagem) FROM compra_tb );