<?php
header('Content-Type: application/json');

// Configura la conexión a la base de datos
$nombre_servidor = "localhost";
$usuario = "root";
$contrasena = "";
$nombre_db = "alumnos"; 

// Crea la conexión
$conexion = new mysqli($nombre_servidor, $usuario, $contrasena, $nombre_db);

// Verifica la conexión
if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

// Consulta para obtener datos de la columna seleccionada
$consulta = "SELECT MIN(Edad) AS y FROM info UNION ALL SELECT Edad FROM ( SELECT Edad, @rownum := @rownum + 1 AS row_number, @total := @total + 1 FROM info, (SELECT @rownum := 0, @total := 0) r ORDER BY Edad ) AS ranked WHERE row_number = FLOOR(0.25 * @total) OR row_number = FLOOR(0.50 * @total) OR row_number = FLOOR(0.75 * @total) UNION ALL SELECT MAX(Edad) AS y FROM info;";
$salida = $conexion->query($consulta);

$datos = array();
if ($salida->num_rows > 0) {
    while($fila = $salida->fetch_assoc()) {
        $datos[] = $fila;
    }
}

// Cierra la conexión
$conexion->close();

// Envía los datos como JSON
echo json_encode($datos);
?>