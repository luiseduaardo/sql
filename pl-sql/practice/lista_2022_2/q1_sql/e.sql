/*
Realize uma consulta que calcule e mostre a média de bagagens 
que um passageiro carrega.
*/

SELECT AVG(tot_bag)
FROM (SELECT cpf_pa, COUNT(*) AS tot_bag
FROM BAGAGEM_TB
GROUP BY cpf_pa);