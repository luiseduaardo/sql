/*
Realize uma consulta que mostre o preço da passagem mais cara da tabela de 
Compra, onde a porcentagem de desconto é igual a 10.
*/

SELECT MAX(C.VALOR)
FROM COMPRA_TB C
WHERE C.PORCENTAGEM = 10;