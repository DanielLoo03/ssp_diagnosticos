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
$columnaCategoria = isset($_POST['columnaCategoria']) ? $_POST['columnaCategoria'] : 'Facultad';
$columnaCategoriaParaValor = isset($_POST['columnaCategoriaParaValor']) ? $_POST['columnaCategoriaParaValor'] : 'Padecimiento';
$columnaValor = isset($_POST['columnaValor']) ? $_POST['columnaValor'] : 'TDAH';

// Consulta para obtener datos de la columna seleccionada
$consulta = "SELECT $columnaCategoria AS label, COUNT(*) AS y FROM info WHERE $columnaCategoriaParaValor = '$columnaValor' GROUP BY $columnaCategoria ORDER BY $columnaCategoria;";
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