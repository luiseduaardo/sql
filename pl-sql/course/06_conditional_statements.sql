-- IF THEN ELSIF/ELSE

SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER := '&enter_place'; -- input de valor
BEGIN
    IF v_num < 10 THEN
        DBMS_OUTPUT.PUT_LINE('Menor que 10');
    ELSIF v_num > 10 THEN
        DBMS_OUTPUT.PUT_LINE('Maior que 10');
    ELSIF v_num = 10 THEN
        DBMS_OUTPUT.PUT_LINE('Igual a 10');
    END IF;  

        DBMS_OUTPUT.PUT_LINE('Fora do IF');
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_num NUMBER := '&enter_place';
BEGIN
    CASE (MOD(v_num, 2))
        WHEN 0 THEN v_num := (v_num/2);
        WHEN 1 THEN v_num := ((v_num+1)/2);
    END CASE;

    DBMS_OUTPUT.PUT_LINE('Valor de v_num: ' || v_num);
END;
/