/*
    COLECCIONES Y TIPOS COMPUESTOS
    
    Son componentes que pueden albergar multiples valores,
    a diferencia de los escalares que solo pueden tener 1.
    
    Hay de 2  tipos:
        - Records: Son similares a los registros de una tabla, pueden
            albergar una file de datos de distintos tipos. 
            Podemos definirlos de forma personalizada con la cláusula RECORD. 
            PUEDEN LLEVAR cláusula NULL Y CLÃ?USULA DEFAULT
            
            Sintaxis:
                TYPE nombre IS RECORD (campo1, campo2)
            UNa vez declarada:
                VARIABLE TIPO;
            Ejemplo:
                    TYPE empleado IS RECORD
                    (nombre varchar2(100),
                    salario number,
                    fecha employees.hire_date%type,
                    datos completos employees%rowtype);
                    emple1 empleado
            
            "más flexibilidad y quieres capturar solo campos especificos, combinarlos de diferentes tablas, 
            o personalizar la estructura de datos."
                    
        - Colecciones o collections: 
            - Arrays asociativos(INDEX BY)
            - Nested tables
            - Varrays
*/

/*
SET SERVEROUTPUT ON

DECLARE
    -- Definición de un tipo RECORD llamado 'empleado' 
    TYPE empleado IS RECORD (
        nombre  VARCHAR2(100),  -- Almacena el nombre completo
        salario NUMBER,   -- Almacena el salario del empleado
        fecha   employees.hire_date%TYPE, -- Almacena la fecha de contrataciÃ³n del empleado
        datos   employees%ROWTYPE -- Almacena todos los datos de una fila de la tabla 'employees'
    );
    
    -- Variable 'empleado1' de tipo 'empleado' record
    empleado1 empleado;
BEGIN
    -- Se realiza una consulta para obtener todos los datos del empleado con ID 100 
    --y se almacenan en 'empleado1.datos'
    SELECT
        *
    INTO empleado1.datos
    FROM
        employees
    WHERE
        employee_id = 100;

    -- Se asigna a 'empleado1.nombre' el nombre completo del empleado
    empleado1.nombre := empleado1.datos.first_name || ' ' || empleado1.datos.last_name;

    -- Se calcula el salario con un descuento del 20% y se asigna a 'empleado1.salario'
    empleado1.salario := empleado1.datos.salary * 0.80;

    -- Se asigna la fecha de contratación del empleado a 'empleado1.fecha'
    empleado1.fecha := empleado1.datos.hire_date;
    
    -- Impresión de los valores almacenados en las variables del RECORD
    dbms_output.put_line(empleado1.nombre);   -- Imprime el nombre completo del empleado
    dbms_output.put_line(empleado1.salario);  -- Imprime el salario con descuento
    dbms_output.put_line(empleado1.fecha);    -- Imprime la fecha de contrataciÃ³n
    dbms_output.put_line(empleado1.datos.first_name); -- Imprime el primer nombre desde 'datos'
END;

*/

/*
DECLARE
    TYPE emp_info IS RECORD (
        emp_name employees.first_name%TYPE,
        emp_salary employees.salary%TYPE,
        dept_name departments.department_name%TYPE
    );
    emp_record emp_info;
BEGIN
    -- Aquí se puede capturar solo los datos necesarios de employees y departments
    SELECT e.first_name, e.salary, d.department_name
    INTO emp_record.emp_name, emp_record.emp_salary, emp_record.dept_name
    FROM employees e, departments d
    WHERE e.department_id = d.department_id AND e.employee_id = 101;
END
*/



/*
    Ejercicio 1 Definir un RECORD con columnas especificas
    Crea un tipo RECORD que almacene el nombre y salario de un empleado. 
    Selecciona los datos del empleado con employee_id = 102 y muestra el nombre y salario en la consola
*/
/*
DECLARE
    --Creación del record
    TYPE empleadorecord IS RECORD (
            nombre       VARCHAR2(25),
            salario      NUMBER,
            filacompleta employees%rowtype
    );
    --Creación de variable
    empleado empleadorecord;
BEGIN
    /*
    SELECT
        first_name,
        salary
    INTO
        empleado.nombre,
        empleado.salario
    FROM
        employees
    WHERE
        employee_id = 101;

    dbms_output.put_line(empleado.nombre || ' '|| empleado.salario);
    
    
    SELECT
        *
    INTO
        empleado.filaCompleta
    FROM
        employees
    WHERE
        employee_id = 101;

    dbms_output.put_line(empleado.filaCompleta.first_name);
    
END;
/
*/

/*
    Ejercicio 2: Actualizar datos y manejar excepciones con RECORD
    Crea un RECORD que almacene los datos de un empleado y 
    luego actualiza su salario. Si no existe un empleado con el employee_id dado, 
    maneja la excepción no_data_found.
*/

/*
DECLARE
    --Creacion del record
    TYPE empleadoInfo IS RECORD (
        empleadoId employees.employee_id%TYPE,
        nombre employees.first_name%TYPE,
        salario employees.salary%TYPE
    );
    --Creacion de la variable
    empleadoRecord empleadoInfo;
BEGIN
    --Sentencia SQL  para almacenar las variables en el record
    SELECT employee_id, first_name, salary 
        INTO empleadoRecord.empleadoId, empleadoRecord.nombre, empleadoRecord.salario 
    FROM employees 
    WHERE employee_id = 104;
    
    empleadoRecord.salario := empleadoRecord.salario * 0.10; -- Incrementar salario
    
    --Actualización
    UPDATE employees
    SET salary = empleadoRecord.salario
    WHERE employee_id = empleadoRecord.empleadoId;
    
    dbms_output.put_line('Salario actualizado para: ' || empleadoRecord.nombre || ' - ' 
    || empleadoRecord.salario);
    
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('Empleado no encontrado.');
END;
*/


/*
    INSERTS Y UPDATES CON RECORDS
*/

--1: Crear tabla basada en regiones
/*
CREATE TABLE regiones AS
        SELECT
            *
        FROM
            regions
        WHERE
            region_id = 0;

DECLARE
    region1 regions%rowtype;
BEGIN
    SELECT
        *
    INTO region1
    FROM
        regions
    WHERE
        region_id = 1;
    
    --INSERT 
    INSERT INTO regiones VALUES region1;

END;
/
*/

--UPDATE
/*
DECLARE
    region1 regions%rowtype;
BEGIN
    region1.region_id := 1;
    region1.region_name := 'Australia';
   
   --UPDATE
    UPDATE regiones
    SET
        row = region1
    WHERE
        region_id = 1;

END;
*/




/*
    Colecciones y tipos compuestos: Almacenan objetos del mismo tipo, parecido a los arrays
 
    Arrays asociativos: Associative arrays (INDEX BY tables)
    - Son colecciones pl/SQL con dos columnas
    - Clave primaria de tipo entero o cadena
    - Valores: un tipo que puede ser escalar o record
    
    codigo | value
    
    SINTAXIS:
    TYPE nombre IS TABLE OF
         tipo de datos que almacenerá el array
         -- INDEX BY VARCHAR2(Indica que los indices serán cadenas de texto)
        INDEX BY PLS_INTEGER | BINARY INTEGER | VARCHAR2(x);
        
    --Creacion de variables
    nombreVariable nombreArray;
    
    --Tipo simple
    PARA ACCEDER AL ARRAY
    ARRAY(N) "N -> Posicion" son dinamicos
    
    --Inicialización
    array(num) := 'contenido';
    array(num) := 'contenido';
    
    --Imprimir
    dbms_output.put_line(array(num));
   
    
    -- TIPO COMPUESTO
    ARRAY(N).campo
    
    SELECT 
        *
    INTO array(1)
    FROM tabla
    WHERE campo = num;
    
    --Imprimir
    dbms_output.put_line(array(1).campo);
    

    METODOS:
    EXISTS (N): DETECTAR SI EXISTE UN ELEMENTO
    COUNT: NÚMERO DE ELEMENTOS
    FIRST: DEVUELVE EL ÍNDICE MÁS PEQUEÑO
    LAST: DEVUELVE EL ÍNDICE MÁS ALTO
    PRIOR(N): DEVUELVE EL ÍNDICE ANTERIOR A N
    NEXT(N): DEVUELVE EL ÍNDICE POSTERIOR A N
    DELETE:BORRA TODO
    DELETE(N): BORRAR EL ÍNDICE N
    DELETE(M,N): BORRA DE LOS ÍNDICES M A N
    
    ejemplo:
    DBMS_OUTPUT.PUT_LINE(DEPTS.LAST);
    DBMS_OUTPUT.PUT_LINE(DEPTS.FIRST);
    IF DEPTS.EXISTS(3 THEN 
        DBMS_OUTPUT.PUT_LINE(DEPTS(3)); 
    ELSE
        DBMS_OUTPUT.PUT_LINE('ESE VALOR NO EXISTE'); 
    END IF;
*/



/*
    Trabajar con arrays asociativos
*/
/*
SET SERVEROUTPUT ON 
DECLARE
    -- Declaración de Arrays
    
    -- Tipo simple
    TYPE departamentos_arrays IS
        TABLE OF departments.department_name%TYPE 
    INDEX BY PLS_INTEGER;
    
    -- Tipo compuesto
    TYPE empleados_arrays IS
        TABLE OF employees%ROWTYPE
    INDEX BY PLS_INTEGER;    
    
    -- Creación de variables
    departamentos departamentos_arrays;
    empleados empleados_arrays;
BEGIN
    
         Tipo simple
    
    -- Inicializacion del array departamentos
    departamentos(1) := 'Informatica';
    departamentos(2) := 'Recursos humanos';
    
    -- Impresion de datos
    dbms_output.put_line(departamentos(1));
    dbms_output.put_line(departamentos(2));
    
    --Métodos
    dbms_output.put_line(departamentos.LAST); -- Trae el ultimo
    dbms_output.put_line(departamentos.FIRST); -- Trae el primero
    
    IF departamentos.EXISTS(3) THEN 
        dbms_output.put_line (departamentos(3)); 
    ELSE
        dbms_output.put_line('ESE VALOR NO EXISTE'); 
    END IF;
    
    
        Tipo complejo
    
    SELECT 
        *
    INTO empleados(1) 
    FROM EMPLOYEES
    WHERE employee_id = 100;
    
    dbms_output.put_line(empleados(1).first_name);
    
    SELECT 
        *
    INTO empleados(2) 
    FROM EMPLOYEES
    WHERE employee_id = 101;
    
    dbms_output.put_line(empleados(2).first_name);
EXCEPTION
    WHEN OTHERS THEN
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
END;
*/



/*
    Practica
*/

/*
    Ejercicio 1:
    1. Crea un array asociativo de tipo NUMBER con índices VARCHAR2.
    2. Agrega varios elementos al array con diferentes índices.
    3. Usa el método EXISTS para verificar si un índice específico está presente en el array.
    4. Usa el método COUNT para obtener el número total de elementos en el array.
    5. Muestra los resultados usando DBMS_OUTPUT.PUT_LINE.
*/
/*
SET SERVEROUTPUT ON
DECLARE
    --Creación del array
    TYPE array_asociativo 
    -- OF number -> tipo de datos que almacenerá el array
    IS TABLE OF NUMBER 
    -- INDEX BY VARCHAR2(Indica que los indices serán cadenas de texto)
    INDEX BY VARCHAR2(50);
    
    --Variale
    numeros array_asociativo ;
BEGIN
    -- Agregando elementos al array
    numeros('A') := 1;
    numeros('B') := 2;
    numeros('C') := 3;
    numeros('D') := 4;
    
    --Verificar que si un indice específico está presente en el array
    IF numeros.exists('A') THEN
        dbms_output.put_line('Si existe');
    END IF;
    
    --Mostrar la cantidad de elementos en el array
    dbms_output.put_line(numeros.count);
END;
*/


/*
    Ejercicio 2:
    1. Crea un array asociativo de tipo VARCHAR2 con índices NUMBER.
    2. Agrega varios elementos al array con diferentes índices.
    3. Usa los métodos FIRST, LAST, PRIOR, y NEXT para recorrer los índices del array y mostrar los valores correspondientes.
*/
/*
SET SERVEROUT ON
DECLARE
    -- Creación del array
    TYPE arrayVarchar IS TABLE OF VARCHAR2(25)
    INDEX BY PLS_INTEGER;
    
    --Creación de la variable
    cadena arrayVarchar;
    
    idx NUMBER;
BEGIN
    --Agregar elementos al array
    cadena(1) := 'Hola';
    cadena(2) := 'Bienvenido';
    cadena(3) := 'Diviertete';
    
    --Impresión de resultados
    dbms_output.put_line(cadena.first); -- Muestra el primer indice
    dbms_output.put_line(cadena.last); -- Muestra el último indice
    --dbms_output.put_line(cadena.prior);
    --dbms_output.put_line(cadena.firs);
  
  dbms_output.put_line('-----------------');
  
  -- Mostrar el indice y el valor
    idx := cadena.FIRST;
    WHILE idx IS NOT NULL LOOP
        dbms_output.put_line('Índice: ' || idx || ', Valor: ' || cadena(idx));
        idx := cadena.NEXT(idx);
    END LOOP;
END;
*/


/*
    Ejercicio 3:
    1. Crea un array asociativo de tipo NUMBER con índices NUMBER.
    2. Agrega varios elementos al array.
    3. Usa el método DELETE para borrar un índice específico.
    4. Usa el método DELETE sin parámetros para borrar todos los elementos.
    5. Muestra el número de elementos después de cada operación para verificar los cambios.
*/
/*
SET SERVEROUTPUT ON
DECLARE
    -- Creación del array
    TYPE array_numerico IS TABLE OF NUMBER
    INDEX BY PLS_INTEGER;
    
    -- Creación de variable
    numeros array_numerico;
    
    indice NUMBER;
BEGIN
    --Agregar elementos
    numeros(1) := 1;
    numeros(2) := 2;
    numeros(3) := 3;
    numeros(4) := 4;
    
    dbms_output.put_line('Elementos del array');
    
    --Bucle que muestre todos los elementos
    indice := numeros.first;
    WHILE indice IS NOT NULL LOOP
        dbms_output.put_line(numeros(indice));
        
        indice := numeros.next(indice);
    END LOOP;
    
    -- Eliminar un índice en especifico
    numeros.DELETE(1);
    
    -- mostrar
    dbms_output.put_line('Elementos despues de borrar uno en especifico');
   
    indice := numeros.first;
    WHILE indice IS NOT NULL LOOP
        dbms_output.put_line(numeros(indice));
        
        indice := numeros.next(indice);
    END LOOP;
    
    -- Borrar indices del 2 al 4
    numeros.DELETE(2, 4);
    -- mostrar
    dbms_output.put_line('Elementos despues de borrar el indice del 2 al 4');
   
    indice := numeros.first;
    WHILE indice IS NOT NULL LOOP
        dbms_output.put_line(numeros(indice));
        
        indice := numeros.next(indice);
    END LOOP;
    
    
    -- Eliminar todo

    numeros.DELETE;
    -- mostrar
    dbms_output.put_line('Arrays sin elementos');
 
    indice := numeros.first;
    WHILE indice IS NOT NULL LOOP
        dbms_output.put_line(numeros(indice));
        
        indice := numeros.next(indice);
    END LOOP;
    
    
END;

*/



/*
    Falta hacer lo del 82
*/




/*
    Practica de Colecciones y Registros
    
    • Creamos un TYPE RECORD que tenga las siguientes columnas
    
    NAME VARCHAR2(100),
    SAL EMPLOYEES.SALARY%TYPE,
    COD_DEPT EMPLOYEES.DEPARTMENT_ID%TYPE);
    
    Creamos un TYPE TABLE basado en el RECORD anterior
    • Mediante un bucle cargamos en la colección los empleados. El campo NAME
    debe contener FIRST_NAME y LAST_NAME concatenado.
    • Para cargar las filas y siguiendo un ejemplo parecido que hemos visto en el
    vídeo usamos el EMPLOYEE_ID que va de 100 a 206
    
    A partir de este momento y ya con la colección cargada, hacemos las siguientes
    operaciones, usando métodos de la colección.
    
    Visualizamos toda la colección
    • Visualizamos el primer empleado
    • Visualizamos el último empleado
    • Visualizamos el número de empleados
    • Borramos los empleados que ganan menos de 7000 y visualizamos de
    nuevo la colección
    • Volvemos a visualizar el número de empleados para ver cuantos se han
    borrado
*/

SET SERVEROUT ON
DECLARE

    --Creación del record
    TYPE empleado_record IS RECORD(
        nombre varchar2(25),
        salario employees.salary%TYPE,
        codigo_departamento employees.department_id%TYPE
    );
    
    -- Creación del array
    TYPE empleadoArrays IS TABLE OF
        empleado_record
    INDEX BY PLS_INTEGER;
    
    --Variables
    empleados empleadoArrays;
    
    id_employee_menor employees.employee_id%TYPE;
    id_employee_mayor employees.employee_id%TYPE;
BEGIN

 --Obtener el id del empleado menor
    SELECT MIN(EMPLOYEE_ID)
    INTO id_employee_menor
    FROM EMPLOYEES;
    
    -- Obtener el id del empleado mayor
    SELECT MAX(EMPLOYEE_ID)
    INTO id_employee_mayor
    FROM EMPLOYEES;
    
        
    -- Mediante un bucle cargamos en la colección los empleados. El campo NAME
    -- debe contener FIRST_NAME y LAST_NAME concatenado.
    FOR i IN id_employee_menor..id_employee_mayor LOOP
        SELECT 
            FIRST_NAME ||' '||
            LAST_NAME,
            SALARY,
            DEPARTMENT_ID
        INTO empleados(i)
        FROM EMPLOYEES
        WHERE employee_id = i;
    END LOOP; 
    
    -- Visualizar toda la colección:

    FOR i IN empleados.first..empleados.last LOOP
        dbms_output.put_line(empleados(i).nombre || ' ' || empleados(i).salario || empleados(i).codigo_departamento);
    END LOOP;
        
    -- Visualizar el primer empleado
    dbms_output.put_line(empleados(empleados.first).nombre || ' ' ||
    empleados(empleados.first).salario || ' ' || empleados(empleados.first).codigo_departamento);
       
    -- Visualizar el ultimo empleado
    dbms_output.put_line(empleados(empleados.last).nombre || ' ' ||
    empleados(empleados.last).salario || ' ' || empleados(empleados.last).codigo_departamento);
   
       
    -- Visualizar el número de empleados
    dbms_output.put_line(empleados.count);

    -- Borramos los empleados que ganan menos de 7000 y visualizamos de
    -- nuevo la colección, empleados.salary < 7000
    FOR i IN empleados.first..empleados.last LOOP
        IF empleados(i).salario < 7000 THEN
            empleados.delete(i);
        END IF;
    END LOOP;
   
     
    -- Visualización
     FOR i IN empleados.FIRST..empleados.LAST LOOP
        dbms_output.put_line(empleados(i).nombre || ' ' || empleados(i).salario || empleados(i).codigo_departamento);
    END LOOP;
    
     -- Visualizar el número de empleados
    dbms_output.put_line(empleados.count);
    
END;
/

