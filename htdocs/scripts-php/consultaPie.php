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
$columna = isset($_POST['columna']) ? $_POST['columna'] : 'Edad';

// Consulta para obtener datos de la columna seleccionada
$consulta = "SET @categoria = '" . mysqli_real_escape_string($conexion, $columna) . "'; CALL ConsultaPie(@categoria);";

// Ejecuta la consulta
if (mysqli_multi_query($conexion, $consulta)) {
    $datos = array();
    
    // Procesa cada resultado
    do {
        // Obtiene el conjunto de resultados
        if ($result = mysqli_store_result($conexion)) {
            // Verifica si hay filas
            if ($result->num_rows > 0) {
                while ($fila = mysqli_fetch_assoc($result)) {
                    $datos[] = $fila; // Almacena los datos en el array
                }
            }
            mysqli_free_result($result); // Libera el conjunto de resultados
        }
    } while (mysqli_next_result($conexion)); // Avanza a la siguiente consulta
} else {
    echo json_encode(["error" => "Error en la consulta: " . mysqli_error($conexion)]);
}

// Cierra la conexión
$conexion->close();

// Envía los datos como JSON
echo json_encode($datos);
?>