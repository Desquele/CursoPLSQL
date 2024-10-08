/*
    3. Excepciones
*/

/*
    Introducciòn a las excepciones: 
    son mecanismos que permiten manejar errores o situaciones 
    inesperadas durante la ejecución de un bloque de código. 
    Cuando ocurre un error, el control del programa pasa a la sección 
    de manejo de excepciones para tomar medidas.
    
    Hay 2 tipos:
        - Oracle (predefinidas): 
            NO_DATA_FOUND: No se encontró ningún dato.
            TOO_MANY_ROWS: La consulta devuelve más de una fila.
            ZERO_DIVIDE: Intento de dividir entre cero.
            
        - Usuario: Crea las propias excepciones
        
        BEGIN
           -- Bloque de código que puede generar errores
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                -- Manejo del error
            WHEN OTHERS THEN
                -- Manejo de cualquier otro error
END;
*/

/*
    Sintaxis
*/
/*
DECLARE
    empleado EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO empleado
    FROM EMPLOYEES
    WHERE EMPLOYEE_ID = 1000;
    
    dbms_output.put_line(empleado.first_name);
    

--Siempre va despues del còdigo principal en un bloque PL/SQL
EXCEPTION
    -- Manejo de una excepción específica (excepcion1)
    WHEN excepcion1 THEN
        NULL;
    WHEN excepcion2 THEN
        NULL;
    -- Manejo de cualquier otra excepción no especificada antes
    WHEN OTHERS THEN
        NULL;
END;
/
*/

/*
    Excepciones predefinidas
*/
/*
DECLARE
    empleado employees%rowtype;
BEGIN
    SELECT
        *
    INTO empleado
    FROM
        employees
    WHERE
        employee_id > 1;

    dbms_output.put_line(empleado.first_name);
    

--Siempre va despues del còdigo principal en un bloque PL/SQL
EXCEPTION
    -- Manejo de una excepción específica (excepcion1)
    WHEN no_data_found THEN
        dbms_output.put_line('Error, empleado inexistente');
    WHEN too_many_rows THEN
        dbms_output.put_line('Error, demasiados empleados');
    WHEN OTHERS THEN
        dbms_output.put_line('Error no definido');
        NULL;
END;
*/

/*
    Ejercicio 1: Excepción NO_DATA_FOUND
    Escribe un bloque PL/SQL que intente recuperar los datos de un empleado usando su employee_id. 
    Si el empleado no existe, captura la excepción NO_DATA_FOUND y muestra un mensaje adecuado.
*/
/*
SET SERVEROUTPUT ON
DECLARE
    empleado EMPLOYEES%ROWTYPE;
BEGIN
    SELECT * INTO empleado
    FROM employees
    WHERE employees.employee_id = 1000;
    
    dbms_output.put_line('Empleado: ' || empleado.first_name || ' ' || empleado.last_name);

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('Empleado no encontrado');
    WHEN OTHERS THEN
        dbms_output.put_line('Error no definido');

    
END;
/
*/

/*
    Escribe un bloque PL/SQL que recupere el salario de un empleado por su departamento. 
    Si hay más de un empleado en el departamento, 
    captura la excepción TOO_MANY_ROWS y muestra un mensaje de error.
*/
/*
DECLARE
    salario employees.salary%TYPE;
BEGIN
    SELECT salary INTO salario
    FROM employees
    WHERE department_id = 90;  -- Un departamento con varios empleados
    
    dbms_output.put_line('Salario del empleado: ' || salario);
    
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            dbms_output.put_line('No encontrado');
        WHEN TOO_MANY_ROWS THEN
            dbms_output.put_line('Demasiadas filas, error');
        WHEN OTHERS THEN
            dbms_output.put_line('Error no definido');
END;
/
SELECT * FROM EMPLOYEES;
*/

/*
    Ejercicio 3: ZERO_DIVIDE
    Crea un bloque que intente dividir dos números. Si ocurre cualquier tipo de error, 
    captura la excepción general OTHERS y muestra un mensaje.
*/

/*
DECLARE
    numero1 NUMBER := 3;
    numero2 NUMBER := 0;
    resultado NUMBER;
BEGIN
    resultado := numero1 / numero2;
    
    dbms_output.put_line(resultado);
    
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            dbms_output.put_line('No se puede realizar la divisiòn');
END;
/
*/

/*
    Excepciones no predefinidas (Son de oracle)
    https://docs.oracle.com/database/121/LNPLS/errors.htm#LNPLS99869
*/
/*
DECLARE
    -- Declaración de una excepción personalizada
    miexcepcion EXCEPTION;

    -- Asignación de un código de error SQL específico a la excepción personalizada
    -- El código de error -937 está siendo asociado a miexcepcion
    PRAGMA exception_init (miexcepcion, -937);

    -- Declaración de dos variables para almacenar resultados de la consulta
    v1 NUMBER;
    v2 NUMBER;
BEGIN
    -- Intento de ejecutar una consulta SQL que puede generar una excepción
    SELECT
        employee_id,  -- Se busca seleccionar un ID de empleado
        SUM(salary)   -- Se intenta calcular la suma de los salarios
    INTO
        v1,           -- Almacena el employee_id
        v2            -- Almacena la suma de salarios
    FROM
        employees;    -- Tabla de empleados

    -- Muestra el valor de v1 (employee_id) si la consulta fue exitosa
    dbms_output.put_line(v1);
    
EXCEPTION
    -- Manejo de la excepción personalizada si ocurre el error -937
    WHEN miexcepcion THEN
        dbms_output.put_line('Funcion de grupo incorrecta');

    -- Manejo de cualquier otra excepción no definida anteriormente
    WHEN OTHERS THEN
        dbms_output.put_line('Error indefinido');
END;
/
*/

/*
    SQLCODE y SQLERRM
    Son funciones de PL/SQL
*/

/*
DECLARE
    empleado EMPLOYEES%ROWTYPE;
    
    --miExcepcion EXCEPTION;
    
    --PRAGMA exception_init(miExcepcion, -1422);
BEGIN
    SELECT * INTO empleado
    FROM employees;
    
    dbms_output.put_line(empleado.salary);
    
EXCEPTION
    WHEN too_many_rows THEN
        dbms_output.put_line('Màs filas que las permitidas');
    WHEN OTHERS THEN
        dbms_output.put_line(SQLCODE); -- Proporciona el còdigo del error
        dbms_output.put_line(SQLERRM); -- Proporciona la descripciòn del error
    
  --  WHEN miExcepcion THEN
  --      dbms_output.put_line('la recuperación exacta devuelve un número mayor de filas que el solicitado');
END;
/
*/

/*
    Practica
*/

/*
    Ejercicio 1:
    
    Crear una SELECT (no un cursor explícito) que devuelva el nombre de un
    empleado pasándole el EMPLOYEE_ID en el WHERE,
    • Comprobar en primer lugar que funciona pasando un empleado
    existente
    • Pasar un empleado inexistente y comprobar que genera un error
    • Crear una zona de EXCEPTION controlando el NO_DATA_FOUND 

    Modificar la SELECT para que devuelva más de un empleado, por ejemplo
    poniendo EMPLOYEE_ID> 100. Debe generar un error. Controlar la
    excepción para que genere un mensaje como “Demasiados empleados
    en la consulta”

*/
/*
SET SERVEROUTPUT ON
--Declaraciòn de variables
DECLARE
    
    --Creaciòn de variable nombre con el tipo de dato de la columna nombre
    empleadonombre employees.first_name%TYPE;
    
BEGIN
    SELECT
        employees.first_name
    INTO empleadonombre
    FROM
        employees
    WHERE
       -- employees.employee_id = 100;
        employees.employee_id > 100;
    dbms_output.put_line('Nombre: ' || empleadonombre);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe');
    WHEN too_many_rows THEN
        dbms_output.put_line('No es posible traer màs de una fila');
END;
/
*/

/*
    Modificar la consulta para que devuelva un error de división por CERO,
    por ejemplo, vamos a devolver el salario en vez del nombre y lo dividimos
    por 0. En este caso, en vez de controlar la excepción directamente,
    creamos una sección WHEN OTHERS y pintamos el error con SQLCODE
    y SQLERR
*/

/*
SET SERVEROUTPUT ON
--Declaraciòn de variables
DECLARE
    
    --Creaciòn de variable nombre con el tipo de dato de la columna nombre
    empleadonombre employees.first_name%TYPE;
    
    --Creaciòn de variable salario
    salario number;
BEGIN
    SELECT
        employees.salary
    INTO salario
    FROM
        employees
    WHERE
       employees.employee_id = 100;
       
       salario := salario / 0;
    dbms_output.put_line(salario);
EXCEPTION
    WHEN no_data_found THEN
        dbms_output.put_line('No existe');
    WHEN too_many_rows THEN
        dbms_output.put_line('No es posible traer màs de una fila');

    WHEN OTHERS THEN
        dbms_output.put_line(SQLCODE);
        dbms_output.put_line(SQLERRM);
END;
/
*/

/*
    Ejercicio 3:
    El error -00001 es clave primaria duplicada
    
     Aunque ya existe una predefinida (DUP_VAL_ON_INDEX) vamos a
    crear una excepción no -predefinida que haga lo mismo.
    • Vamos a usar la tabla REGIONS para hacerlo más fácil
    • Usamos PRAGMA EXCEPTION_INIT y creamos una excepción
    denominada “duplicado”.
    • Cuando se genere ese error debemos pintar “Clave duplicada, intente
    otra”.   
*/
/*
SET SERVEROUTPUT ON

DECLARE
    restricionclaveprimariaduplicada EXCEPTION;
    PRAGMA exception_init ( restricionclaveprimariaduplicada, -00001 );
BEGIN
    INSERT INTO regions 
    VALUES (1, 'nueva');

EXCEPTION
    WHEN restricionclaveprimariaduplicada THEN
        dbms_output.put_line('Clave duplicada, intente otra');
END;
/
*/

/*
    Controla SQL con excepciones
*/
/*
SET SERVEROUTPUT ON
DECLARE
    --Declaraciòn de variables
    reg regions%rowtype;
    reg_control regions.region_id%TYPE;
BEGIN
    --Asignaciòn de valores
    reg.region_id := 100;
    reg.region_name := 'AFRICA';
    
    --Consulta SQL
    SELECT
        region_id
    INTO reg_control
    FROM
        regions
    WHERE
        region_id = reg.region_id;
    
    --Mostrar el resultado
    dbms_output.put_line('La regiòn ya existe');
EXCEPTION
    WHEN no_data_found THEN
        INSERT INTO regions 
        VALUES (reg.region_id,reg.region_name);
        COMMIT;
END;
*/



/*
    Excepciones de usuario
    SOn las excepciones creadas por los usuarios 
*/
/*
DECLARE
    -- Definir una excepción personalizada
    excepcion_region_maxima EXCEPTION;
    
    -- Declarar variables para almacenar los valores de la región
    id_region NUMBER;          -- Almacena el ID de la región
    nombre_region VARCHAR2(200);  -- Almacena el nombre de la región

BEGIN
    -- Asignar valores a las variables
    id_region := 101;          
    nombre_region := 'ASIA';   

    -- Condición para verificar si el ID de la región es mayor a 100
    IF id_region > 100 THEN
        -- Lanzar la excepción personalizada si el ID es mayor que 100
        RAISE excepcion_region_maxima;
    ELSE
        -- Si el ID es menor o igual a 100, insertar la región en la tabla 'regions'
        INSERT INTO regions
        VALUES (id_region, nombre_region);
    END IF;

EXCEPTION
    -- Manejo de la excepción 'excepcion_region_maxima'
    WHEN excepcion_region_maxima THEN
        -- Mostrar un mensaje cuando el ID de la región es mayor que 100
        dbms_output.put_line('La ID de la región no puede ser mayor que 100');

    -- Manejo de cualquier otra excepción no especificada
    WHEN OTHERS THEN
        -- Mostrar un mensaje con el código de error y su descripción
        dbms_output.put_line('Código de error: ' || SQLCODE || ', Descripción: ' || SQLERRM);
END;
*/


/*
    Crear una Excepción personalizada denominada
    CONTROL_REGIONES.

*/

/*
SET SERVEROUTPUT ON
DECLARE
    control_regiones EXCEPTION;
    id_region regions.region_id%TYPE;
    nombre_region regions.region_name%TYPE;
BEGIN
    id_region := 201;
    nombre_region := 'ejemplo';
    
    if id_region > 200 THEN
        RAISE control_regiones;
    ELSE
        INSERT INTO regions
        VALUES(id_region, nombre_region);
    END IF;
    
EXCEPTION
    WHEN control_regiones THEN
        dbms_output.put_line('Debe ser inferior a 200');
END;
/
*/


/*
    Ambitos de las excepciones "Similar a las variables"
    0 sea, el bloque hijo puede acceder a los atributos del bloque padre pero no al revez
*/
/*
DECLARE
    -- Declaración de variables principales
    region_id NUMBER;               
    region_name VARCHAR2(200);   
BEGIN
    -- Asignación de valores a las variables
    region_id := 101;              
    region_name := 'ASIA';
    
    -- Bloque anidado
    DECLARE
        -- Declaración de excepción personalizada
        region_id_exceed EXCEPTION; 
    BEGIN
        -- Verifica si el ID de la región es mayor que 100
        IF region_id > 100 THEN
            -- Si el ID es mayor que 100, lanza la excepción region_id_exceed
            RAISE region_id_exceed;
        ELSE
            -- Si el ID es menor o igual a 100, inserta la región en la tabla 'regions'
            INSERT INTO regions
            VALUES (region_id, region_name);
            COMMIT;  -- Realiza un commit para guardar los cambios en la base de datos
        END IF;
    EXCEPTION
        -- Captura la excepción region_id_exceed lanzada en el bloque anidado
        WHEN region_id_exceed THEN
            -- Muestra un mensaje si el ID es mayor a 100
            DBMS_OUTPUT.PUT_LINE('El ID de la región no puede ser mayor de 100. BLOQUE HIJO');
    END;
END;
*/



/*
    RAISE_APPLICATION_ERROR
*/
/*
DECLARE
    -- Declarar variables para almacenar los valores de la región
    id_region NUMBER;          -- Almacena el ID de la región
    nombre_region VARCHAR2(200);  -- Almacena el nombre de la región

BEGIN
    -- Asignar valores a las variables
    id_region := 101;          
    nombre_region := 'ASIA';   

    -- Condición para verificar si el ID de la región es mayor a 100
    IF id_region > 100 THEN
        -- Lanzar la excepción  si el ID es mayor que 100
        RAISE_APPLICATION_ERROR (-20001, 'LA ID NO PUEDE SER MAYOR DE 100'); (-20000 Y -20999)
    ELSE
        -- Si el ID es menor o igual a 100, insertar la región en la tabla 'regions'
        INSERT INTO regions
        VALUES (id_region, nombre_region);
    END IF;
END;
*/

/*
    EJERCICIO:
    Modificar la practica anterior para disparar un error con RAISE_APPLICATION
    en vez de con PUT_LINE.
*/
SET SERVEROUTPUT ON

DECLARE
    control_regiones EXCEPTION;
    codigo NUMBER := 201;
BEGIN
    IF codigo > 200 THEN
        RAISE control_regiones;
    ELSE
        INSERT INTO regions 
        VALUES (codigo,'PRUEBA');

    END IF;
EXCEPTION
    WHEN control_regiones THEN
        raise_application_error(-20001, 'El codigo debe ser inferior a 200');
    WHEN OTHERS THEN
        dbms_output.put_line(sqlcode);
        dbms_output.put_line(sqlerrm);
END;