/*
Packages/pacotes são livrarias armazenadas na base de
dados que nos permitem agrupar objetos de maneira agrupada
sob um só nome.

Podemos fazer uma analogia muito distante com classes em
linguagens que suportam o paradigma orientado a objetos.

Em um pacote podemos armazenas
- Procedimentos
- Funções
- Cursores
- Declarações de tipos de registro
- Variáveis
*/

/*
ARQUITETURA DE UMA PACKAGE
As duas partes da arquitetura de um pacote são armazenadas
de maneira separada na memória do banco de dados.

- Package Specification (header) - obrigatório
Contém a declaração de todos os elementos do pacote.
Aqui, os elementos do pacote são declarados, mas não definidos.

    CREATE OR REPLACE PACKAGE pkg_name AS
        declaração de todos os elementos do pacote...;
    END pkg_name;

- Package Body - opcional, mas recomendado
Contém a definição, estruturação e implementação de 
todos os elementos do pacote.
Elementos de uma package que não estão na header, mas
são colocados no body são chamados de elementos privados.

    CREATE OR REPLACE PACKAGE BODY pkg_name AS
        declaracao de variáveis e tipos...
    BEGIN
        implementação dos elementos do pacote...
    END pkg_name;
*/

CREATE OR REPLACE PACKAGE pkg_sample AS
    FUNCTION prnt_str RETURN VARCHAR2;
    PROCEDURE proc_superhero (f_name VARCHAR2, l_name VARCHAR2);
END pkg_sample;
/

-- podemos escrever em outro arquivo como um .hpp e .cpp
CREATE OR REPLACE PACKAGE BODY pkg_sample AS
    FUNCTION prnt_str RETURN VARCHAR2 IS
    BEGIN
        RETURN 'abc.com';
    END prnt_str;

    PROCEDURE proc_superhero (f_name VARCHAR2, l_name VARCHAR2) IS
    BEGIN
        INSERT INTO superheroes (first_name, last_name)
        VALUES (f_name, l_name);
    END proc_superhero;
END pkg_sample;