/*
Crie um bloco de código que exibe quantas horas de voo um piloto possui, no formato: 
“Victor Luiz tem 12 horas de voo registradas”.
*/

DECLARE
    hv NUMBER(7,2);

    CURSOR pilotos IS
        SELECT p.nome, p.cpf FROM tripulante_tb t
        INNER JOIN pessoa_tb p
        ON t.cpf_pe = p.cpf
        WHERE cargo = 'Piloto';
BEGIN
    FOR piloto IN pilotos LOOP
        SELECT  SUM(EXTRACT(HOUR FROM v.data_chegada-v.data_partida)) +  
                SUM(EXTRACT(MINUTE FROM  v.data_chegada-v.data_partida))/60 
        INTO hv
        FROM ESCALA_TB e
        INNER JOIN VOO_TB v
        ON e.codigo_voo = v.codigo
        WHERE e.cpf_tri = piloto.cpf;

        DBMS_OUTPUT.PUT_LINE('O piloto ' || piloto.nome || ' possui ' || hv || ' horas registradas de voo.');
    END LOOP;
END;
/

-- Para qualquer cargo
DECLARE
    hv NUMBER(7,2);

    CURSOR pilotos IS
        SELECT p.nome, p.cpf, t.cargo FROM tripulante_tb t
        INNER JOIN pessoa_tb p
        ON t.cpf_pe = p.cpf;
BEGIN
    FOR piloto IN pilotos LOOP
        SELECT  SUM(EXTRACT(HOUR FROM v.data_chegada-v.data_partida)) +  
                SUM(EXTRACT(MINUTE FROM v.data_chegada- v.data_partida))/60 
        INTO hv
        FROM ESCALA_TB e
        INNER JOIN VOO_TB v
        ON e.codigo_voo = v.codigo
        WHERE e.cpf_tri = piloto.cpf;

        DBMS_OUTPUT.PUT_LINE('O ' || piloto.cargo || ' ' || piloto.nome || ' possui ' || hv || ' horas registradas de voo.');
    END LOOP;
END;
/