/*
    COLECCIONES Y TIPOS COMPUESTOS
    
    Son componentes que pueden albergar múltiples valores,
    a diferencia de los escalares que solo pueden tener 1.
    
    Hay de 2 posibles tipos:
        - Records: Son similares a los registros de una tabla, pueden
            albergar una file de datos de distintos tipos. POdemos definirlos
            de forma personalizada con la clàusula RECORD. PUEDEN LLEVAR CLÁUSULA NULL Y CLÁUSULA DEFAULT
            
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
            
            "más flexibilidad y quieres capturar solo campos específicos, combinarlos de diferentes tablas, 
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
        fecha   employees.hire_date%TYPE, -- Almacena la fecha de contratación del empleado
        datos   employees%ROWTYPE -- Almacena todos los datos de una fila de la tabla 'employees'
    );
    
    -- Variable 'empleado1' de tipo 'empleado'
    empleado1 empleado;
BEGIN
    -- Se realiza una consulta para obtener todos los datos del empleado con ID 100 y se almacenan en 'empleado1.datos'
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
    dbms_output.put_line(empleado1.fecha);    -- Imprime la fecha de contratación
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
    -- Aquí puedes capturar solo los datos necesarios de employees y departments
    SELECT e.first_name, e.salary, d.department_name
    INTO emp_record.emp_name, emp_record.emp_salary, emp_record.dept_name
    FROM employees e, departments d
    WHERE e.department_id = d.department_id AND e.employee_id = 101;
END
*/


/*
    Ejercicio 1
*/
/*
SET SERVEROUTPUT ON
DECLARE
    TYPE empleado IS RECORD (
        nombre varchar2(50),
        salario employees.salary%type,
        informacionFila employees%rowtype
    );
    
   empleado1 empleado; 

BEGIN
    SELECT * 
        INTO empleado1.informacionFila
    FROM employees
    WHERE employee_id = 101;
    
    empleado1.nombre := empleado1.informacionFila.first_name;
    empleado1.salario := empleado1.informacionFila.salary;
    
    dbms_output.put_line(empleado1.nombre);
    dbms_output.put_line(empleado1.salario);
    dbms_output.put_line(empleado1.informacionFila.salary);
END;
/
*/

/*
    Ejercicio 2 Definir un RECORD con columnas específicas
    Crea un tipo RECORD que almacene el nombre y salario de un empleado. 
    Selecciona los datos del empleado con employee_id = 102 y muestra el nombre y salario en la consola
*/

/*
DECLARE
    TYPE emp_info IS RECORD (
        nombre employees.first_name%TYPE,
        salario employees.salary%TYPE
    );
    emp_record emp_info;
BEGIN
    SELECT first_name, salary INTO emp_record.nombre, emp_record.salario FROM employees WHERE employee_id = 102;
    
    dbms_output.put_line('Nombre: ' || emp_record.nombre);
    dbms_output.put_line('Salario: ' || emp_record.salario);
END;
*/

/*
    Ejercicio 4: Actualizar datos y manejar excepciones con RECORD
    Crea un RECORD que almacene los datos de un empleado y 
    luego actualiza su salario. Si no existe un empleado con el employee_id dado, 
    maneja la excepción no_data_found.
*/
/*
DECLARE
    TYPE emp_info IS RECORD (
        emp_id employees.employee_id%TYPE,
        nombre employees.first_name%TYPE,
        salario employees.salary%TYPE
    );
    emp_record emp_info;
BEGIN
    SELECT employee_id, first_name, salary 
        INTO emp_record.emp_id, emp_record.nombre, emp_record.salario 
    FROM employees 
    WHERE employee_id = 104;
    
    emp_record.salario := emp_record.salario * 0.10; -- Incrementar salario
    
    UPDATE employees
    SET salary = emp_record.salario
    WHERE employee_id = emp_record.emp_id;
    
    dbms_output.put_line('Salario actualizado para: ' || emp_record.nombre || ' - ' || emp_record.salario);
    
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
CREATE TABLE regiones
    AS
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