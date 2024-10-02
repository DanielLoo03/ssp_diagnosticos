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

// Obtiene la columna seleccionada mediante POST
$columnaCategoria1 = isset($_POST['columnaCategoria1']) ? $_POST['columnaCategoria1'] : 'Institución';
$columnaCategoria2 = isset($_POST['columnaCategoria2']) ? $_POST['columnaCategoria2'] : 'Género';

// Consulta para obtener datos de la columna seleccionada
$consulta = "SELECT $columnaCategoria1 AS categoria1, 
                    $columnaCategoria2 AS categoria2, 
                    COUNT(*) AS y 
             FROM info 
             GROUP BY $columnaCategoria1, $columnaCategoria2 
             ORDER BY $columnaCategoria1, $columnaCategoria2;";
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