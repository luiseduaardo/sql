/*
Realize uma consulta que mostre os nomes, CPF, idade e fidelidade dos 
passageiros que residem em Recife, Campo Grande ou Rondonópolis.
*/

SELECT pes.nome, pes.cpf, pes.idade, pas.fidelidade
FROM passageiro_tb pas
INNER JOIN pessoa_tb pes
ON pas.cpf_pe = pes.cpf
INNER JOIN endereco_tb e
ON pes.cpf = e.cpf
INNER JOIN cep_tb c
ON c.cep = e.cep
WHERE c.cidade IN ('Recife', 'Campo Grande', 'Rondonópolis');
