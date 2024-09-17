/*
    Excepciones de usuario practica
*/
DECLARE
    --1. Definir excepción personalizada
    excepcionRegionId EXCEPTION;
    
    idRegion NUMBER;
    nombreRegion VARCHAR2(100);
BEGIN
    idRegion := 2;
    nombreRegion := 'Prueba';
    
    IF idRegion <=7 THEN
        raise excepcionRegionId;
    ELSE
        INSERT INTO REGIONS
        VALUES(idRegion,nombreRegion );
    END IF;
    
EXCEPTION
    WHEN excepcionRegionId THEN
        dbms_output.put_line('El id debe ser mayor que 7');
    WHEN OTHERS THEN
        dbms_output.put_line('Codigo: ' || sqlcode || 'Descripcion: ' || SQLERRM);
END;
/
