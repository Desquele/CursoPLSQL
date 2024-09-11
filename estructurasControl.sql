/*
    Estructuras de control
*/

/*
    Operadores logicos y relaciones
    
    Operadores relaciones o de comparaciòn
        = (igual a )
        <> (Distinto de)
        < (Menor que)
        > (Mayor que)
        <= (Menor o igual)
        >= (Mayor o igual a)
        
    Operadores lògicos
        AND (Y)
        NOT (Negacion)
        OR (O)
*/

/*
    IF
*/
/*
SET SERVEROUTPUT ON

DECLARE
    x NUMBER := 20;
BEGIN
    IF x = 10 THEN
        dbms_output.put_line('x= 10');
    ELSE
        dbms_output.put_line('Otro valor');
    END IF;
END;
*/

/*
SET SERVEROUTPUT ON

DECLARE
    sales NUMBER := 20000;
    bonus NUMBER := 0;
BEGIN
    IF sales > 50000 THEN
        bonus := 1500;
    ELSIF sales > 35000 THEN
        bonus := 500;
    ELSIF sales > 20000 THEN
        bonus := 150;
    ELSE
        bonus := 100;
    END IF;

    dbms_output.put_line('Sales:= '
                         || sales
                         || ', bonus:= '
                         || bonus);
END;

*/

/*
SET SERVEROUTPUT ON
  
DECLARE
  numero NUMBER := 15;
  resultado NUMBER;
BEGIN

    resultado := MOD(numero, 2);
    IF resultado = 0 THEN
        dbms_output.put_line('Es par');
    ELSE
        dbms_output.put_line('Es impar');
    END IF;
END;

*/

/*
SET SERVEROUTPUT ON
DECLARE
    letra CHAR(1);
BEGIN
    letra := 'Q';
    
    IF letra = 'A' THEN
        dbms_output.put_line('Electronica');
    ELSIF letra = 'B' THEN
        dbms_output.put_line('Informatica');
    ELSIF letra = 'C' THEN
        dbms_output.put_line('Ropa');
    ELSIF letra = 'D' THEN
        dbms_output.put_line('Musica');
    ELSIF letra = 'E' THEN
        dbms_output.put_line('LIbros');
    ELSE
        dbms_output.put_line('NO hay informaciòn');
    END IF;
END;

*/

/*
--Comparar dos numeros
SET SERVEROUTPUT ON
DECLARE
    numero1 NUMBER;
    numero2 NUMBER;
BEGIN
    numero1 := 5;
    numero2 := 5;
    
    IF numero1 > numero2 THEN
        dbms_output.put_line('Numero1 es mayor porque el valor es de: ' || numero1);
    ELSIF numero2 > numero1 THEN
        dbms_output.put_line('Numero2 es mayor porque el valor es de: ' || numero2);
    ELSE
        dbms_output.put_line('Son numeros iguales');
    END IF;
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
    numero NUMBER;
    numeroResultado NUMBER;
BEGIN
    numero:= 1;
    numeroResultado := MOD(numero, 2);
    
    IF numero > 0 AND numeroResultado = 0 THEN
        dbms_output.put_line('El nùmero es positivo y par');
    ELSE -- SOLO ELSE o ELSIF numero < 0 OR numeroResultado <> 0 THEN
        dbms_output.put_line('El nùmero no es positivo y par');
    END IF;
    
END;

*/

/*
SET SERVEROUTPUT ON
DECLARE
    edad NUMBER;
BEGIN
    edad := 65;
    IF edad >= 65 THEN
        dbms_output.put_line('Tercera edad');
    ELSIF edad >= 18 THEN
        dbms_output.put_line('Mayor de edad');
    ELSIF edad >= 0 THEN
        dbms_output.put_line('Menor de edad');
        
    END IF;
END;

*/

/*
    CASE
*/
/*
SET SERVEROUT ON
DECLARE
    v1 CHAR(1);
BEGIN
    v1 := 'B';
    
    CASE v1
        WHEN 'A' THEN dbms_output.put_line('Excellent');
        WHEN 'B' THEN dbms_output.put_line('Very good');
        WHEN 'C' THEN dbms_output.put_line('Good');
        WHEN 'D' THEN dbms_output.put_line('Fair');
        WHEN 'F' THEN dbms_output.put_line('Poor');
        ELSE dbms_output.put_line('No such value');
    END CASE;
END;
*/

/*
SET SERVEROUT ON
DECLARE
    v1 NUMBER;
BEGIN
    v1 := 30;
    
    CASE v1
        WHEN 10 THEN dbms_output.put_line('Excellent');
        WHEN 20 THEN dbms_output.put_line('Very good');
        WHEN 30 THEN dbms_output.put_line('Good');
        WHEN 40 THEN dbms_output.put_line('Fair');
        WHEN 50 THEN dbms_output.put_line('Poor');
        ELSE dbms_output.put_line('No such value');
    END CASE;
END;

*/

/*
SET SERVEROUTPUT ON
DECLARE
    bonus number;
BEGIN
    bonus := 100;
    
    CASE
        WHEN bonus > 500 THEN
            dbms_output.put_line('Excellent');
        WHEN bonus <= 500 AND bonus > 250 THEN
            dbms_output.put_line('Very good');
        WHEN bonus <= 250 AND bonus > 100 THEN
            dbms_output.put_line('Good');
        ELSE dbms_output.put_line('POOR...');
    END CASE;
  
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
    numero1 NUMBER;
    numero2 NUMBER;
BEGIN
    numero1 := 30;
    numero2 := 30;
    
    IF numero1 > numero2 THEN
        dbms_output.put_line('Numero 1 es mayor que numero 2');
        
    ELSIF numero2 > numero1 THEN
        dbms_output.put_line('Nùmero 2 es mayor que numero 1');
    ELSE
        dbms_output.put_line('Son iguales');
    END IF;
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
    nota NUMBER;
BEGIN
    nota:=5;
    
    CASE nota
        WHEN 10 THEN dbms_output.put_line('Excelente');
        WHEN 5 THEN dbms_output.put_line('Aplazado');
        ELSE dbms_output.put_line('NO hay informaciòn');
    END CASE;
    
    
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
    nota NUMBER;
BEGIN
    nota:=8;
    
    CASE 
        WHEN nota >= 8 AND nota <=10 THEN dbms_output.put_line('Excelente');
        WHEN nota >=6 AND nota <=7 THEN dbms_output.put_line('Pasable');
        ELSE dbms_output.put_line('NO hay informaciòn');
    END CASE;
    
    
END;

*/

/*
    Practica estructura de control
*/

/*
SET SERVEROUTPUT ON
DECLARE
    usuario VARCHAR2(240);
BEGIN
    usuario:= user; --Funcion de oracle que devuelve el user, sin argumentos no es necesario poner parèntesis
    
    
    CASE usuario
        WHEN 'SYS' THEN dbms_output.put_line('Eres super administrador');
        WHEN 'SYSTEM' THEN dbms_output.put_line('Eres un admisnitrador normal');
        WHEN 'HR' THEN dbms_output.put_line('Eres de recursos humanos');
        ELSE dbms_output.put_line('Usuario no autorizado');
    END CASE;

END;

*/

/*
    BUCLES
*/

/*
    BUCLE LOOP
*/

/*
SET SERVEROUTPUT ON
DECLARE
    x NUMBER :=1;
BEGIN
        LOOP
            dbms_output.put_line(x);
            x:=x+1;
            --Si x = 11 entonces ejecutame exit (salir del bucle)       
            EXIT WHEN x=11; --Exit Permite salir del bucle
            
        END LOOP;
        
        
END;

*/

/*
    Practica
 */ 

/*
--1: IMprimir nùmeros del 1 al 20
SET SERVEROUTPUT ON
DECLARE
        contador PLS_INTEGER := 0;
BEGIN

    LOOP
        contador := contador + 1;
        dbms_output.put_line(contador);
        
        EXIT WHEN contador = 20;
    END LOOP;
END;

  */

/*

--Sumar los primeros 10 nùmeros
SET SERVEROUTPUT ON
DECLARE
    contador PLS_INTEGER:=1;
    suma PLS_INTEGER:=0;
BEGIN
    LOOP
        suma:= suma + contador;
        contador := contador + 1;
        
        EXIT WHEN contador =11;
    END LOOP;
    
    dbms_output.put_line(suma);
END;

-- Ejercicio 3: Contar mùltiplos de 3 entre 1 y 30
SET SERVEROUTPUT ON
DECLARE
    contadorBucle PLS_INTEGER := 1;
    contadorMultiplos PLS_INTEGER := 0;
BEGIN
    
    LOOP
    
        Verifica
        IF MOD(contadorBucle, 3)  = 0 THEN
            contadorMultiplos := contadorMultiplos + 1;
        END IF;
        
        contadorBucle :=contadorBucle + 1;
        EXIT WHEN contadorBucle = 31; 
        
    END LOOP;
    dbms_output.put_line(contadorMUltiplos);
END;

*/
/*
    LOOPS ANIDADOS
*/

/*
SET SERVEROUTPUT ON

DECLARE
    s PLS_INTEGER := 0;
    i PLS_INTEGER := 0;
    j PLS_INTEGER;
BEGIN
    --Etiquetar, SON ETIQUETAS
    << parent >> LOOP
    --Print parent
        i := i + 1;
        j := 100;
        dbms_output.put_line('Parent: ' || i);
        << child >> LOOP
        --Print child
            EXIT parent WHEN ( i > 3 );
            dbms_output.put_line('Child: ' || j);
            j := j + 1;
            EXIT child WHEN ( j > 105 );
        END LOOP child;

    END LOOP parent;
    dbms_output.put_line('FINISH');
END;

*/

/*
    CONTINUE
    Es útil cuando deseas que, bajo ciertas condiciones, 
    el flujo del bucle se reinicie desde el comienzo, 
    omitiendo el resto de las instrucciones en la iteración actual.
*/

/*
SET SERVEROUTPUT ON
DECLARE
    x NUMBER := 0;
BEGIN
    LOOP
        dbms_output.put_line('Loop: x = ' || to_char(x));
        x := x + 1;
        
        --podemos impedir que siga ejecutando lineas y volvamos al inicio
        --será omitida si x es menor que 3.
        CONTINUE WHEN x < 3; --Es mejor utilizar esto segùn la documenntacion
        dbms_output.put_line('Despues de continue: x = ' || to_char(x));
        EXIT WHEN x = 5;
    END LOOP;
END;
*/

/*
    Practica continue
*/

/*
    1- Ejercicio 1: Imprimir números pares entre 1 y 20
    Crea un bloque PL/SQL que utilice un bucle para 
    imprimir solo los números pares entre 1 y 20. 
    Usa CONTINUE para saltar los números impares.

SET SERVEROUTPUT ON
DECLARE
    contador NUMBER := 1;
BEGIN
    LOOP
        contador := contador + 1;  -- Incrementar el contador al principio para evitar el bucle infinito
        
        CONTINUE WHEN MOD(contador, 2) != 0;  -- Continuar si es impar
        
        dbms_output.put_line(contador);  -- Imprimir si es par
        
        EXIT WHEN contador > 20;  -- Salir cuando el contador sea mayor que 20
    END LOOP;
END;

*/

/*
--SUma de numeros menos multiplos de 3
SET SERVEROUTPUT ON
DECLARE
    x NUMBER := 1;  -- Inicializamos la variable 'x' con valor 1
    suma NUMBER := 0;  -- Variable para acumular la suma de los números
BEGIN
    LOOP
        -- Si x es múltiplo de 3, salta la iteración
        CONTINUE WHEN MOD(x, 3) = 0;
        
        suma := suma + x;  -- Solo suma si x no es múltiplo de 3
        
        x := x + 1;  -- Incrementamos 'x' en 1 para la siguiente iteración
        
        EXIT WHEN x = 11;  -- Detener el bucle cuando 'x' llegue a 11
    END LOOP;
    
    dbms_output.put_line('La suma de los números que no son múltiplos de 3 es: ' || suma);
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
    x NUMBER := 1;
BEGIN
    LOOP
        -- Si x es 5, 7 o 13, salta la iteración
        CONTINUE WHEN x IN (5, 7, 13);
        
        dbms_output.put_line('Número: ' || x);
        
        x := x + 1;
        
        EXIT WHEN x = 16;  -- Detener el bucle cuando x llegue a 16
    END LOOP;
END;

*/

/*
    BUCLE FOR
*/

/*
SET SERVEROUTPUT ON
DECLARE
    i varchar(20):= 'des';
BEGIN
-- FOR, variable, rango separado por dos puntos
-- Deben de ser numericos (PLS_INTEGER)
-- i solo sirve en el bucle for
    FOR i IN 1..10 LOOP
        dbms_output.put_line(i);   
        EXIT WHEN i = 10; --momento en que i sea igual a 10 se sale
    END LOOP;
    dbms_output.put_line(i);
    dbms_output.put_line('REVERSE'); 
    
    FOR i IN REVERSE 1..10 LOOP
        dbms_output.put_line(i);   
    END LOOP;
END;
*/

/*
SET SERVEROUTPUT ON
DECLARE
BEGIN
   
   FOR i IN 1..10 
   LOOP
    dbms_output.put_line(i);
   END LOOP;
   
END;
*/
--for ejemplo

-- 1 MOstrar los nùmeros del 1 - 100

/*
SET SERVEROUTPUT ON
BEGIN
    FOR i IN 1..10 LOOP
        dbms_output.put_line(i);
    END LOOP;
END;
*/

--   Sumar los nùmeros del 1 al 100

/*
SET SERVEROUTPUT ON
DECLARE
    suma NUMBER :=0;
BEGIN
    FOR i IN 1..100 LOOP
        suma := suma + i;
    END LOOP;
    
    dbms_output.put_line(suma);

END;
*/

-- 3: Mostrar nùmeros pares entre 1 y 20
/*
SET SERVEROUTPUT ON
BEGIN
    FOR i IN 1..20 LOOP
        CONTINUE WHEN MOD(i, 2) != 0; -- va a pasar los numeros  impares para mostrar los pares
        dbms_output.put_line(i);
    END LOOP;
END;
*/

/*

SET SERVEROUTPUT ON
BEGIN
    FOR i IN 1..20 LOOP
        if MOD(i, 2) = 0   THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;
END;

*/

-- Ejercicio 4: MUltiplicaciòn acumulado (1 - 10)
/*
SET SERVEROUTPUT ON
DECLARE
    multiplicador number :=1;
BEGIN
    FOR i IN 1..10 LOOP
        multiplicador := multiplicador * i;
    END LOOP;
    
    dbms_output.put_line('La multiplicaciòn es: ' || multiplicador);
    
END;

*/

--Nùmeros en orden descendente (20 -1)
/*
SET SERVEROUTPUT ON
BEGIN
    for i IN REVERSE 1..20  LOOP
        dbms_output.put_line(i);
    END LOOP;
    
END;
*/

/*
    Bucle WHILE
    NOs permite realizar un bucle controlado
    "mientras se cumpla la condicion"
*/

/*
SET SERVEROUTPUT ON
DECLARE
    done BOOLEAN := FALSE;
    x NUMBER := 0;
BEGIN
    
    WHILE x < 10 LOOP
        dbms_output.put_line(x);
        x:= x + 1;
        EXIT WHEN x = 5;
    END LOOP;

    WHILE done LOOP
        DBMS_OUTPUT.PUT_LINE('NO imprimas esto.');
        done := TRUE;
    END LOOP;
    
    WHILE NOT done LOOP
        dbms_output.put_line('Ha pasado por aquì');
        done := true;
    END LOOP;

END;

*/

/*
    Practica del PDF
*/

/*
    Practica 1
    Vamos a crear la tabla de multiplicar del 1 al 10, con los tres tipos de
    bucles: LOOP, WHILE y FOR
*/

--Loop
/*
DECLARE
    x NUMBER;
    z NUMBER;
BEGIN
    x := 1;
    z := 1;
    LOOP
        EXIT WHEN x = 11;
        dbms_output.put_line('Tabla de multiplicar del :' || x);
        LOOP
            EXIT WHEN z = 11;
            dbms_output.put_line(x * z);
            z := z + 1;
        END LOOP;

        z := 0;
        x := x + 1;
    END LOOP;

END;

WHILE

DECLARE
    x NUMBER;
    z NUMBER;
BEGIN
    x := 1;
    z := 1;
    WHILE x < 11 LOOP
        dbms_output.put_line('Tabla de multiplicar del :' || x);
        WHILE z < 11 LOOP
            dbms_output.put_line(x * z);
            z := z + 1;
        END LOOP;

        z := 0;
        x := x + 1;
    END LOOP;

END;

BEGIN
    FOR x IN 1..10 LOOP
        dbms_output.put_line('Tabla de multiplicar del :' || x);
        FOR z IN 1..10 LOOP
            dbms_output.put_line(x * z);
        END LOOP;

    END LOOP;
END;

*/

/*
    Practica 2:
    Mediante el bucle WHILE escribir la frase al revez
*/

/*
SET SERVEROUTPUT ON
DECLARE
    texto VARCHAR2(25) := 'Hola';
    textoReves VARCHAR2(25);
    tamano PLS_INTEGER;
BEGIN
    tamano := LENGTH(texto);

    WHILE tamano >  0 LOOP
        
        textoReves := textoReves || SUBSTR(texto, tamano,1);
        
        tamano := tamano -1;
    END LOOP;
    
    dbms_output.put_line(textoReves);
END;

*/

/*
    Práctica 4
    -   Debemos crear una variable llamada NOMBRE
    -   Debemos pintar tantos asteriscos como letras tenga el nombre.
    -   Usamos un bucle FOR
    -   Por ejemplo Alberto → *******
    -   O por ejemplo Pedro → *****
*/
/*
DECLARE
    nombre     VARCHAR2(100);
    tamanoNombre PLS_INTEGER;
    asteriscos VARCHAR2(100);
BEGIN
    nombre := 'ALBERTO';
    tamanoNombre := length(nombre);
    
    FOR i IN 1..tamanoNombre LOOP
        asteriscos := asteriscos || '*';
    END LOOP;

    dbms_output.put_line(nombre
                         || '-->'
                         || asteriscos);
END;

*/

/*
    Practica 5
    
    • Creamos dos variables numéricas, "inicio y fin"
    • Las inicializamos con algún valor:
    o Debemos sacar los números que sean múltiplos de 4 de ese rango
*/

DECLARE
    inicio NUMBER;
    final  NUMBER;
BEGIN
    inicio := 10;
    final := 200;
    FOR i IN inicio..final LOOP
        IF MOD(i, 4) = 0 THEN
            dbms_output.put_line(i);
        END IF;
    END LOOP;

END;

