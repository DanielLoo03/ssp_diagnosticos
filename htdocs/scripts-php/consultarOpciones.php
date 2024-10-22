<?php
// Conectar a la base de datos
$nombre_servidor = "localhost";
$usuario = "root";
$contrasena = "";
$nombre_db = "alumnos"; 

// Crea la conexión
$conexion = new mysqli($nombre_servidor, $usuario, $contrasena, $nombre_db);

if ($conexion->connect_error) {
    die("Conexión fallida: " . $conexion->connect_error);
}

// Obtener la categoría seleccionada
$categoria = $_GET['categoria'];

// Definir la consulta SQL según la categoría seleccionada
$consulta = "SELECT DISTINCT " . $categoria . " FROM info";

// Ejecutar la consulta y construir el resultado en JSON
$resultado = $conexion->query($consulta);
$opciones = [];

if ($resultado->num_rows > 0) {
    while($fila = $resultado->fetch_assoc()) {
        $opciones[] = $fila[$categoria];
    }
}

// Devolver el resultado en formato JSON
echo json_encode($opciones);

// Cerrar la conexión
$conexion->close();
?>
