DELIMITER //

CREATE PROCEDURE ConsultaBarras()
BEGIN
    SELECT Padecimiento, COUNT(*) AS y
    FROM info
    GROUP BY Padecimiento;
END //


CREATE PROCEDURE ConsultaBoxplot()
BEGIN
    -- Declarar las variables
    DECLARE rownum INT DEFAULT 0;
    DECLARE total INT DEFAULT 0;

    -- Obtener el mínimo, percentiles y máximo de la edad
    SELECT MIN(Edad) AS y 
    FROM info 
    UNION ALL 
    SELECT Edad 
    FROM (
        SELECT Edad, @rownum := @rownum + 1 AS row_number, @total := @total + 1 
        FROM info, (SELECT @rownum := 0, @total := 0) r 
        ORDER BY Edad 
    ) AS ranked 
    WHERE row_number = FLOOR(0.25 * @total) 
       OR row_number = FLOOR(0.50 * @total) 
       OR row_number = FLOOR(0.75 * @total) 
    UNION ALL 
    SELECT MAX(Edad) AS y 
    FROM info;
END //


CREATE PROCEDURE ConsultaPie(IN columna VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT ', columna, ' AS x, COUNT(*) AS y FROM info GROUP BY ', columna, ' ORDER BY ', columna);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //


CREATE PROCEDURE ConsultaTendencias(IN columna VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT ', columna, ' AS x, COUNT(*) AS y FROM info GROUP BY ', columna, ' ORDER BY ', columna);
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //


CREATE PROCEDURE ConsultaValoresDeColumna(IN categoria VARCHAR(255))
BEGIN
    SET @sql = CONCAT('SELECT DISTINCT ', QUOTE(categoria), ' FROM info');
    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    DEALLOCATE PREPARE stmt;
END //

DELIMITER ;