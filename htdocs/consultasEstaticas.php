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
$consulta = "SELECT Padecimiento, COUNT(*) AS y FROM info GROUP BY Padecimiento;";
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