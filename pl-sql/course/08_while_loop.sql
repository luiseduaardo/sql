SET SERVEROUTPUT ON;
DECLARE
    v_value NUMBER;
    v_factor NUMBER := 0;
BEGIN
    WHILE v_factor <= 10 LOOP
        v_value := 19 * v_factor;
        DBMS_OUTPUT.PUT_LINE('19 x ' || v_factor || ' = ' || v_value);
        v_factor := v_factor + 1;
    END LOOP;
END;
/

SET SERVEROUTPUT ON;
DECLARE
    v_counter   NUMBER := 0;
BEGIN
    WHILE v_counter <= 20 LOOP
        IF MOD(v_counter, 2) = 0 THEN
            DBMS_OUTPUT.PUT_LINE(v_counter || ' é Par');
        ELSE
            DBMS_OUTPUT.PUT_LINE(v_counter || ' é Ímpar');
        END IF;

        v_counter := v_counter + 1;
    END LOOP;
END;