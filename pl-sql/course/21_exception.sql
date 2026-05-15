/*
Uma excessão é uma condição anormal que interrompe o fluxo
normal das instruções de um programa em sua execução.

- Excessões definidas pelo sistema
Definidas e mantidas de maneira implicita pela Oracle.

- Excessões definidas pelo usuário
Excessões declaradas de maneira explícitas em blocos.
*/

/*
1. Usando uma variável de tipo EXCEPTION
São levantadas de maneira explícita no programa usando RAISE
    1. Declare uma variável de tipo exception
    2. Levante (Raise) a excessão
    3. Lide (Handle) com a excessão
*/

CREATE OR REPLACE FUNCTION divisao (dividendo NUMBER, divisor NUMBER) RETURN NUMBER IS
    var_dividendo   NUMBER := dividendo;
    var_divisor     NUMBER := divisor;
    var_resultado   NUMBER;
    div_zero        EXCEPTION;
BEGIN
    IF var_divisor = 0 THEN
        RAISE div_zero;
    END IF;

    var_resultado := var_dividendo / var_divisor;

    RETURN var_resultado;
EXCEPTION
    WHEN div_zero THEN
        DBMS_OUTPUT.PUT_LINE("ATENÇÃO! NÃO É PERMITIDO DIVISÃO POR 0.");
END divisao;

/*
2. Usando PRAGMA EXCEPTION_INIT: associa um nome de 
exceção (declarado como variável EXCEPTION) a um número 
de erro interno do Oracle. Permite o tratamento de erros 
do sistema pelo nome ao invés do genérico WHEN OTHERS.

PRAGMA EXCEPTION_INIT (exception_name, error_number);
*/

DECLARE
    ex_age      EXCEPTION;
    age         NUMBER := 17;
    PRAGMA EXCEPTION_INIT(ex_age, -20008);
BEGIN
    IF age < 18 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Menores de 18 anos não podem dirigir.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Você pode dirigir.');
EXCEPTION
    WHEN ex_age THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;

/*
3. RAISE_APPLICATION_ERROR: declara uma excessão com 
número (entre -20000 e -20999) e mensagem customizadas. 
Aborta a execução do bloco imediatamente e envia o erro
ao usuário ou à aplicação solicitante.
*/

ACCEPT var_age NUMBER PROMPT 'How old are you?';
DECLARE
    age     NUMBER := &var_age;
BEGIN
    IF age < 18 THEN
        RAISE_APPLICATION_ERROR(-20008, 'Menores de 18 anos não podem dirigir.');
    END IF;

    DBMS_OUTPUT.PUT_LINE('Você pode dirigir.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;