/*
    USAR SQL EN PL/SQL
*/

/*
    1. Selects dentro de PL/SQL
    El resultado del select se deben de guardar en variables
    
    * Utiliza la clausula INTO para guardar el resultado*
*/

--Declaracion de bloquee
/*
SET SERVEROUTPUT ON
DECLARE
    salario NUMBER; -- Declaracion de variable donde se guardarà el resultado
BEGIN
    --Obtener el salario del empleado id 100
    SELECT 
        salary INTO salario --Into indica donde se guardara el resultado
    FROM 
        EMPLOYEES
    WHERE
        employee_id = 100;
        
    --Mostrando el resultado
    dbms_output.put_line(salario);
END;
*/

--Cuando se trae màs de un resultado

/*
SET SERVEROUTPUT ON

DECLARE
    salario NUMBER; -- Declaración de variable para almacenar el salario
    nombre  employees.first_name%TYPE; -- Tipo de dato de la columna FIRST_NAME
BEGIN
    -- Obtener el salario y nombre del empleado con ID 100
    --Solo puede devolver una sola fila, no 0 no màs de una (se soluciona con cursores)
    SELECT salary, first_name
        INTO salario, nombre
    FROM
        employees
    WHERE
        employee_id = 100;
    
    -- Mostrar el resultado
    dbms_output.put_line(nombre
                         || ' tiene un salario de: '
                         || salario);
END;
*/





/*
    %ROWTYPE "Recuperar tantas columnas"
    Se usa para declarar una variable que puede almacenar una fila completa de una tabla o 
    el resultado de una consulta con una estructura similar a la de una tabla o vista. Esta hereda la estructura 
    y tipos de datos de todas las columnas de la tabla o consulta
*/

/*
SET SERVEROUTPUT ON

DECLARE
    empleado EMPLOYEES%ROWTYPE; --Variable que almacena toda una fila de empleados
BEGIN
    -- Obtener el salario y nombre del empleado con ID 100
    --Solo puede devolver una sola fila, no 0 no màs de una (se soluciona con cursores)
    SELECT *
        INTO empleado
    FROM
        employees
    WHERE
        employee_id = 100;
    
    -- Mostrar el resultado
    dbms_output.put_line(empleado.first_name
                         || ' tiene un salario de: '
                         || empleado.salary);
END;
*/




/*
    Practica 1:
    Crear un bloque PL/SQL que devuelva al salario máximo del
    departamento 100 y lo deje en una variable denominada salario_maximo
    y la visualice
*/  

/*
SET SERVEROUTPUT ON
DECLARE
    --Variable que contendrà el salario, con el tipo de dato de la columna 'Salary'
    salario_maximo Employees.salary%TYPE; 
BEGIN
    SELECT 
        MAX(salary) INTO salario_Maximo
    FROM EMPLOYEES
    WHERE department_id = 100;
    
    --Mostrar resultado
    dbms_output.put_line('El salario maximo del departamento 100 es:' || salario_Maximo);
END;
*/




/*
    Practica 2:
    Visualizar el tipo de trabajo del empleado número 100
*/

/*
SET SERVEROUTPUT ON
DECLARE
 --Variable que contendrà el tipo de trabajo, con el tipo de dato de la columna 'job_id'
    tipoTrabajo EMPLOYEES.job_id%TYPE;
BEGIN
    SELECT 
        job_id INTO tipoTrabajo
    FROM EMPLOYEES
    WHERE employee_id = 100;
    
    --Mostrar resultado
    dbms_output.put_line('EL tipo de trabajo es: ' || tipoTrabajo);
END;
*/


/*
    Practica 3
    
    - Crear una variable de tipo DEPARTMENT_ID y ponerla algún valor, por
      ejemplo 10.
      
    - Visualizar el nombre de ese departamento y el número de empleados
       que tiene, poniendo. Crear dos variables para albergar los valores.
*/

/*
SET SERVEROUTPUT ON
DECLARE
    --Declaracion de variable, con el mismo tipo de dato de department_id
    departamento_id DEPARTMENTS.department_id%TYPE;
    
    --Declaracion de variable, con el mismo tipo de dato de department_name
    departamento_nombre DEPARTMENTS.department_name%type;
    
    --declaraciòn de variable ue gaurdarà el numero de empleados
    numeroEmpleados number;
    
BEGIN

    --Valor con 10
    departamento_id := 10;
    
    --Traer el nombre del departmento
    SELECT department_name
        INTO departamento_nombre
    FROM DEPARTMENTS
    WHERE department_id = departamento_id;
    
    --Traer el nùmero de empleados
    SELECT COUNT(*)
        INTO numeroEmpleados
    FROM EMPLOYEES
    WHERE department_id = departamento_id;
    
    --Mostrando el resultado
    dbms_output.put_line(departamento_nombre);
    dbms_output.put_line(numeroEmpleados);
END;
*/



/*
    Practica 4:
    Mediante dos consultas recuperar el salario máximo y el salario mínimo
    de la empresa e indicar su diferencia
*/

/*
SET SERVEROUTPUT ON
DECLARE
    --Declaracion de variables
    salarioMayor number;
    salarioMenor number;
    salarioDiferencia number;
BEGIN
    
    SELECT 
        MAX(salary), MIN(salary)  INTO salarioMayor, salarioMenor
    FROM EMPLOYEES;
    
    salarioDiferencia := salarioMayor - salarioMenor;
    
    dbms_output.put_line('Salario mayor: ' || salarioMayor || ' ' || 'Salario menor: ' || salarioMenor  ||  ' ' 
    || 'diferencia'  || ' ' || salarioDiferencia);
END;

*/






/*
    INSERTS
*/
/*
SET SERVEROUTPUT ON
DECLARE
    col1 TEST.C1%TYPE;
BEGIN
    col1:=10;
    
    INSERT INTO TEST (c1, c2)
    VALUES (col1, 'Douglas');
    
    COMMIT; --Deberia de llevarlo en insert, update, delete
END;
*/



/*
    UPDATES
*/

/*
DECLARE
--Variable con el mismo tipo de dato que c1
    t Test.C1%TYPE;
BEGIN
    t:=10;
    
    UPDATE TEST
    SET c2= 'Des'
    WHERE c1 = t;
    
    commit;
END;
*/


/*
    DELETE
*/

/*
DECLARE
    t TEST.c1%TYPE;
BEGIN
    t := 10;
    
    DELETE FROM
    TEST WHERE c1 = t;
    
    COMMIT;
END;
/   -> Deben de llevarla, es como separacin
*/



/*
    Practica 1:
    
    Crear un bloque que inserte un nuevo departamento en la tabla
    DEPARTMENTS. Para saber el DEPARTMENT_ID que debemos asignar al
    nuevo departamento primero debemos averiguar el valor mayor que hay en la
    tabla DEPARTMENTS y sumarle uno para la nueva clave
    
    • Location_id debe ser 1000
    • Manager_id debe ser 100
    • Department_name debe ser “INFORMATICA”
    • NOTA: en PL/SQL debemos usar COMMIT y ROLLBACK de la misma
    forma que lo hacemos en SQL. Por tanto, para validar definitivamente un
    cambio debemos usar COMMIT.
    
    
*/
SELECT * FROM DEPARTMENTS;


SET SERVEROUTPUT ON
DECLARE
    --Declaracion de variables 
    departamento_idMayor DEPARTMENTS.department_id%TYPE;
    departamento_location_id DEPARTMENTS.location_id%TYPE;
    departmento_manager_id DEPARTMENTS.manager_id%TYPE;
    departamento_departamento_nombre DEPARTMENTS.department_name%TYPE;
BEGIN

    departamento_location_id := 1000;
    departamento_departamento_nombre := 'INFORMATICA';
    departmento_manager_id := 100;
    
    SELECT 
        MAX(department_id) INTO departamento_idMayor
    FROM DEPARTMENTS;
    
    departamento_idMayor := departamento_idMayor + 1;
    
    INSERT INTO DEPARTMENTS(department_id,department_name,manager_id,location_id)
    VALUES(departamento_idMayor, departamento_departamento_nombre, 
    departmento_manager_id, departamento_location_id);
    
    COMMIT;
END;
/

