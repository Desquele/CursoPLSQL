/*
    Cursores:
        Estructuras que permiten a los programas trabajar
        con conjuntos de resultados obtenidos de una consulta SQL
        
        1- Implicitos: Se crean automáticamente cada vez que se ejecuta 
        una instrucción CRUD. Son utiizados cuando solo hay un único registro afectado
        
        2- Explicitos: Deben ser declarados y gestionados manualmente. 
        Son útiles cuando la consulta devuelve varios registros o se necesita 
        mayor control sobre el procesamiento de filas. Se utiliza en consultas complejas que 
        devuelven más de una fila.
            
            Pasos: 
                Declarar el cursor.
                Abrir el cursor.
                Recuperar las filas con FETCH.
                Cerrar el cursor

*/


/*
    Atributos implicitos
*/

/*
SQL%ISOPEN -> Aplica solo a cursores explícitos porque verifica si un cursor está abierto.
SQL%FOUND --> Indica si se devolvió al menos una fila.
SQL%NOTFOUND -->  Indica si no se devolvieron filas.
SQL%ROWCOUNT --> Devuelve el número de filas afectadas por una operación SQL.
*/
DECLARE BEGIN
    
/*
    SQL%FOUND:
     Indica si la última operación DML (como INSERT, UPDATE, DELETE) o 
     una consulta SQL devolvió alguna fila.
     
     Valor:
        TRUE: Si la operación afectó alguna fila o devolvió un registro.
        FALSE: Si no devolvió filas.
*/

    UPDATE employees
    SET
        salary = salary * 1.1
    WHERE
        employee_id = 100;

    IF SQL%found THEN
        dbms_output.put_line('Se actualizó al menos un registro.');
    ELSE
        dbms_output.put_line('No se actualizaron registros.');
    END IF;
    
    
    
    
    /*
    SQL%NOTFOUND:
     Es el opuesto de %FOUND. 
     Indica si la operación no devolvió filas.
     
     Valor:
        TRUE:  Si no se afectó ninguna fila.
        FALSE:  Si se afectó alguna fila.
    */

    DELETE FROM employees
    WHERE
        employee_id = 999;

    IF SQL%notfound THEN
        dbms_output.put_line('No se encontró ningún empleado con ese ID.');
    END IF;
    
    
    /*
    SQL%ROWCOUNT:
     Devuelve el número de filas afectadas por la 
     última operación INSERT, UPDATE, DELETE o 
     la consulta SELECT INTO.
    */
    UPDATE employees
    SET
        salary = salary * 1.1
    WHERE
        employee_id = 100;

    dbms_output.put_line('Se actualizaron '
                         || SQL%rowcount
                         || ' registros.');
END;
/



/*
    Crear cursor
*/
/*
DECLARE
    -- Declarar el cursor
    CURSOR regions_cursor IS SELECT * FROM regions;

    regionsfila regions%rowtype;
BEGIN
    -- Abrir el cursor
    OPEN regions_cursor;
    
    -- Leer el cursor y guardar el primer valor en v1
    FETCH regions_cursor INTO regionsfila;
    
    -- Imprimir
    dbms_output.put_line(regionsfila.region_name);
    
     -- Leer el cursor y se guarda el segundo valor en v1
    FETCH regions_cursor INTO regionsfila;
    
    -- Imprimir
    dbms_output.put_line(regionsfila.region_name);
    
    -- Cerrar el cursor
    CLOSE regions_cursor;
END;
/
*/

/*
    Atributos cursores explicitos
    
    nombreCursor%atributo
    
    c1%ISOPEN    
    c1%FOUND
    c1%NOTFOUND
    c1%ROWCOUNT
*/


/*
    Recorrer cursor
*/

-- LOOP
/*
DECLARE
    CURSOR cursor_regions IS SELECT * FROM regions;
    
    fila_regions regions%rowtype;
BEGIN
    OPEN cursor_regions;
    
    LOOP
        FETCH cursor_regions INTO fila_regions;
        EXIT WHEN cursor_regions%NOTFOUND; -- Salir del bucle cuando ya no haya filas
        dbms_output.put_line(fila_regions.region_name);  
    END LOOP;
    
    CLOSE cursor_regions;
END;
/
*/


-- BUCLE FOR
/*
DECLARE
    CURSOR cursor_regions IS SELECT * FROM regions;
BEGIN
    -- No se ocupa el open, close, fetch, into
    FOR i IN cursor_regions LOOP
        dbms_output.put_line(i.region_name);  
    END LOOP;
END;
/
*/

-- BUCLE FOR CON SUBQUERIES
/*
SET SERVEROUTPUT ON
BEGIN
    FOR i IN (SELECT * FROM REGIONS) LOOP
        dbms_output.put_line(i.region_name);
    END LOOP;
END;
*/





/*
    Cursores con parametros
*/
/*
DECLARE
    CURSOR cursor_empleados(salario NUMBER) IS SELECT * FROM employees WHERE salary > salario;
    
    empleado employees%rowtype;
BEGIN
    OPEN cursor_empleados(10000);
    
    LOOP 
        FETCH cursor_empleados INTO empleado;
        EXIT WHEN cursor_empleados%NOTFOUND;
        
        dbms_output.put_line(empleado.first_name || ' ' || empleado.salary);
    END LOOP;
    
    dbms_output.put_line('Número de empleados: ' || cursor_empleados%rowcount || ' ' || 'empleados');
END;
*/



/*
    WHERE CURRENT OF
*/
DECLARE
    CURSOR cursor_empleado_actualizar IS SELECT * FROM employees FOR UPDATE;
    
    empleado_actualizar employees%rowtype;
BEGIN
    OPEN cursor_empleado_actualizar;
    
    LOOP
        FETCH cursor_empleado_actualizar INTO empleado_actualizar;
        EXIT WHEN cursor_empleado_actualizar%NOTFOUND;
        
        IF empleado_actualizar.commission_pct IS NOT NULL THEN
            UPDATE employees
                SET salary = salary * 0.10
            -- Fila actual
            WHERE CURRENT OF cursor_empleado_actualizar;
        ELSE
            UPDATE employees
                SET salary = salary * 0.20
            WHERE CURRENT OF cursor_empleado_actualizar;
        END IF;
    END LOOP;
    
    CLOSE cursor_empleado_actualizar;
END;
/
