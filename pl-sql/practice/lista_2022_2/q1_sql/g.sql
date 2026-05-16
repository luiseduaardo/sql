/*
Realize uma consulta que mostre o CNPJ e nome da companhia aérea que possui o número de contato “08008871118”.
*/

SELECT c.cnpj, c.nome
FROM COMP_AEREA_TB c
LEFT JOIN TELEFONE_COMP_AEREA_TB t
ON c.cnpj = t.cnpj_cia
WHERE t.contato = '08008871118';

SELECT * FROM COMP_AEREA_TB WHERE COMP_AEREA_TB.CNPJ = 
(SELECT CNPJ_CIA FROM TELEFONE_COMP_AEREA_TB WHERE TELEFONE_COMP_AEREA_TB.contato ='08008871118');