/*
    Bloques anònimos
*/
/*
BEGIN
    DBMS_OUTPUT.PUT_LINE(4);
END;
*/
/*
SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE(4);
    DBMS_OUTPUT.PUT_LINE('Douglas Quele');
    DBMS_OUTPUT.PUT_LINE('Douglas' || 'Quele');
END;
*/
/*
SET SERVEROUTPUT ON
BEGIN
    DBMS_OUTPUT.PUT_LINE('DOUGLAS' || ' QUELE');
    DBMS_OUTPUT.PUT_LINE(19);

END;
*/

/*
	Variables
*/
/*
SET SERVEROUTPUT ON
DECLARE
    IVA NUMBER:=10;
BEGIN
    DBMS_OUTPUT.PUT_LINE(IVA);
END;
*/

--CONSTANT AND NULL
/*
SET SERVEROUT PUT ON
DECLARE
    IVA CONSTANT NUMBER:=13.5; --NO se puede cambiar
    Z NUMBER NOT NULL:=10; --No puede estar vacio, puede cambiar
BEGIN
    DBMS_OUTPUT.PUT_LINE(IVA);
    DBMS_OUTPUT.PUT_LINE(Z);

    Z:=16;
    DBMS_OUTPUT.PUT_LINE(Z);
END;
*/

--Suma
/*
SET SERVEROUTPUT ON
DECLARE
    numero1  NUMBER:=10;
    numero2  NUMBER NULL:=5;
BEGIN
    DBMS_OUTPUT.PUT_LINE(numero1 + numero2);
END;

*/
/*
SET SERVEROUTPUT ON
DECLARE
    numero1  NUMBER:=10;
    numero2  NUMBER:=NULL;
    numero3 CONSTANT NUMBER:=12;
    resultado NUMBER;
BEGIN
    resultado := numero1 + numero3;
    DBMS_OUTPUT.PUT_LINE(resultado);
END;

*/

/*
SET SERVEROUTPUT ON
DECLARE
    nombre VARCHAR2(100):= 'Douglas';
    edad NUMBER;
    fechaNacimiento DATE;
BEGIN
    edad := 22;
    fechaNacimiento := '16/11/2001';

    DBMS_OUTPUT.PUT_LINE(nombre);
    DBMS_OUTPUT.PUT_LINE(edad);
    DBMS_OUTPUT.PUT_LINE(fechaNacimiento);
END;

*/

/*
	Boolean
    Existe:
        - TRUE
        - FALSE
        - NULL
*/

/*
SET SERVEROUTPUT ON
DECLARE
    b1 BOOLEAN;
BEGIN
    b1:= FALSE;
    b1:= TRUE;
    b1:= NULL;

END;
*/

--                              04/09/2024

/*
    %TYPE
        Permite crear una variable que sea delmismo tipo que otra
        Se le puede decir que una variable es del mismo tipo que "x" columna
*/
/*
SET SERVEROUTPUT ON
DECLARE
    numero1 NUMBER:=11;
    numero2 numero1%TYPE:=20;
    --var     tabla.columna
    emplee EMPLOYEES.SALARY%TYPE;
BEGIN
    DBMS_OUTPUT.PUT_LINE(numero1);
        DBMS_OUTPUT.PUT_LINE(numero2);

END;

*/

/*
    (Cualquier variable que no se inicialize devolverà NULL)
    OPERADORES
    
    + SUMA
    - RESTA
    / DIVISIÒN
    * MULTIPLICACIÒN
    '' EXPONENTE
    | | CONCATENAR
*/
/*
SET SERVEROUTPUT ON
DECLARE
    --sino se inicializa = null
    x NUMBER:=0;
    z NUMBER:=5;
    a VARCHAR(20):='Douglas';
    d DATE:='16/11/2001';
BEGIN

    DBMS_OUTPUT.PUT_LINE(a  || x); --cadena de caracteres conctena
  --  DBMS_OUTPUT.PUT_LINE(a  + x);  --No funciona porque son caracteres los dos
    DBMS_OUTPUT.PUT_LINE(d);
    DBMS_OUTPUT.PUT_LINE(SYSDATE);
    DBMS_OUTPUT.PUT_LINE(SYSDATE-d);
    DBMS_OUTPUT.PUT_LINE(d+1);
END;
*/

/*
    PARTE PRACTICA
*/
/*
SET SERVEROUTPUT ON
--Declaraciòn de variables
DECLARE
    impuesto CONSTANT NUMBER:=0.21;
    precioProducto NUMBER(5,2) NOT NULL;
    resultado precioProducto%type;
BEGIN
    --Indicando el precio del producto
    precioProducto:=100;
    
    --Haciendo el proceso
    resultado:= precioProducto * impuesto;
    
    DBMS_OUTPUT.PUT_LINE(resultado);
END;

*/

/*
    Bloques anidados
    Permite agrupar, ordenar trozos de golpes
    es una especie de bloque que se encuentra dentro de otro
    
    Son independientes los bloques pero heredan cosas
*/

/*
SET SERVEROUTPUT ON -- solo una vez, porque es aplicado a toda la desiòn.

BEGIN
    dbms_output.put_line('Primer bloque, padre');
    DECLARE
        numero1 NUMBER := 4;
    BEGIN
        dbms_output.put_line(numero1);
    END;
END;

*/

/*
    Àmbito de variables en bloques anidados
    "Las variables del bloque padre pueden ser accedidas
        por el bloque hijo pero no al contrario"
        
    El bloque hijo no sobreescribe, sino que es variable propia.
*/

/*
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 20; --Variable Global
    z NUMBER := 30; --Variable Global
BEGIN
    dbms_output.put_line('X:= ' || x);
    
    DECLARE
        x NUMBER := 10; --Variable Local
        propiaHIjo NUMBER := 16;
    BEGIN
        dbms_output.put_line('X:= ' || x);
        dbms_output.put_line('Z:= ' || z);    -- busca en el bloque de el (hija) sino existe busca en el bloque padre    
        dbms_output.put_line('Y:= ' || propiaHIjo);
    END;
        dbms_output.put_line('Y:= ' || propiaHIjo); -- Da error porque variables del bloque hijo son propias, o puede acceder el padre

END;
*/

/*
    Indicar que valores visualiza X en los 3 casos de
    DBMS_OUTPUT.PUT_LINE(x) en este ejemplo
    
    R// Aparece 10,20, 10 porque el bloque hijo define su propia variable, aunque
    si bien es cierto que se pueden acceder desde el bloque hijo pero este puede
    definir sus propias variables a pesar que sea el mismo nombre, no se sobreescribe porque en este caso fuera del bloque hijo
    si se imprime la variable de nuevo, esta se muestra con el valor que fue dado en el bloque padre.
    
*/
/*
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
    DECLARE
        x NUMBER := 20;
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;
*/

/*
¿Es este bloque correcto? Si no es así ¿por qué falla? no es correcto
SET SERVEROUTPUT ON
BEGIN
    dbms_output.put_line(x);
    DECLARE
        x NUMBER := 20;
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;

*/


/*
¿Es este bloque correcto? Si es así ¿qué valores visualiza X?
Si, es correcto porque el bloque hijo està accediendo a la variable del bloque padre
y recordemos que eso se puede, y visualiza 10 en las tres ocasiones
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 10;
BEGIN
    dbms_output.put_line(x);
    BEGIN
        dbms_output.put_line(x);
    END;
    dbms_output.put_line(x);
END;

*/




/*
    USO DE FUNCIONES SQL EN PL SQL
    FUnciones de SQL se puede utilizar dentro de PLSQL
    estas se utilzan directamente dentro de PLSQL
    
    PERO SOLO SE PUEDEN FUNCIONES SIMPLES
    
    NO SE PUEDE:
        - Funciones de grupo: count, avg, etc.
        - DECODE (especie de case)
        - 
*/

/*
SET SERVEROUTPUT ON
DECLARE
    x VARCHAR2(20);
    mayus VARCHAR(20);
    fecha DATE;
    z NUMBER:=109.80;
BEGIN
    x:= 'Douglas';
    mayus:= UPPER(x);
    fecha:= SYSDATE;
    
    dbms_output.put_line(SUBSTR(x,1, 3));    -- No esla misma que sql porque se ejecuta dentro de PL no SQL
    dbms_output.put_line(mayus);
    dbms_output.put_line(fecha);
    dbms_output.put_line(ROUND(z, 2));
END;

*/

/*
    PRACTICA FUNCIONES
    Falta add
*/

SET SERVEROUTPUT ON
DECLARE
    nombre VARCHAR2(20);
    apellido1 VARCHAR2(20);
    apellido2 VARCHAR2(20);
BEGIN
    nombre := SUBSTR(UPPER('douglas'), 1, 1);
    apellido1:= REPLACE(UPPER('siguenza'), ('iguenza', ' ')); -- Primero la sustitucion y luego el upper mejor
    apellido2:= UPPER(REPLACE('quele', 'quele', ' ')); -- Primero UPPER y luego replace
    
    dbms_output.put_line(nombre);
        dbms_output.put_line(apellido1);
            dbms_output.put_line(apellido2);
END;

--Falta modificar la practica de fnciones

