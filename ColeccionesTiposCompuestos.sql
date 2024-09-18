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
        tipoColumna
        INDEX BY PLS_INTEGER | BINARY INTEGER | VARCHAR2(x);
        
    Ejemplo
    --Departamentos
    TYPE DEPARTAMENTOS IS TABLE OF
        DEPARTMENTS.DEPARTMENT_NAME%TYPE
    INDEX BY PLS_INTEGER
    
    TYPE EMPLEADOS IS TABLE OF
        EMPLOYEES%ROWTYPE
    INDEX BY PLS_INTEGER;
    
    --Creacion de variables
    depts DEPARTAMENTOS;
    empls EMPLEADOS;
    
    --Tipo simple
    PARA ACCEDER AL ARRAY
    ARRAY(N) "N -> Posicion" son dinamicos
    
    depts(1) := 'Informatica';
    depts(2) := 'RRHH';
    
    --Imprimir
    dbms_output.put_line(depts(1));
   
    
    -- TIPO COMPUESTO
    ARRAY(N).campo
    SELECT 
        *
    INTO empls(1)
    FROM employees
    WHERE employee_id = 100;
    
    --Imprimir
    dbms_output.put_line(empls(1).first_name);
    
    
    
    
    METODOS:
    EXISTS (N): DETECTAR SI EXISTE UN ELEMENTO
    COUNT: NÚMERO DE ELEMENTOS
    FIRST: DEVUELVE EL ÍNDICE MÁS PEQUEÑO
    LAST: DEVUELVE EL ÍNDICE MÁS ALTO
    PRIOR(N): DEVUELVE EL ÍNDICE ANTERIOR A N
    NEXT(N): DEVUELVE EL ÍNDICE POSTERIOR A N
    DELETE:BORRA TODO
    DELETE(N): BORRAR EL ÍNDICE N
    DELETE(M,N): BORRA DE LOS ÍNDICES MAN
    
    ejemplo:
    DBMS_OUTPUT.PUT_LINE(DEPTS.LAST);
    DBMS_OUTPUT.PUT_LINE(DEPTS.FIRST);
    IF DEPTS.EXISTS(3 THEN 
        DBMS_OUTPUT.PUT_LINE(DEPTS(3)); 
    ELSE
        DBMS_OUTPUT.PUT_LINE('ESE VALOR NO EXISTE'); 
    END IF;
*/
