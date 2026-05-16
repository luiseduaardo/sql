/*
Realize uma consulta que mostre o CPF e o valor total gasto de 
todos os passageiros que já gastaram mais de 10 mil em passagens.
*/

SELECT cpf_pa, SUM(valor) FROM COMPRA_TB
GROUP BY cpf_pa
HAVING SUM(valor) > 10000;