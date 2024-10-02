-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 02, 2024 at 02:03 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `alumnos`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `InsertarEstudiantes` ()   BEGIN
    DECLARE i INT DEFAULT 0;
    
    WHILE i < 100 DO
        SET @estado = ELT(FLOOR(1 + RAND() * 32), 'Aguascalientes', 'Baja California', 'Baja California Sur', 'Campeche', 'Chiapas', 'Chihuahua', 'Coahuila', 'Colima', 'Durango', 'Guanajuato', 'Guerrero', 'Hidalgo', 'Jalisco', 'Estado de México', 'Michoacán', 'Morelos', 'Nayarit', 'Nuevo León', 'Oaxaca', 'Puebla', 'Querétaro', 'Quintana Roo', 'San Luis Potosí', 'Sinaloa', 'Sonora', 'Tabasco', 'Tamaulipas', 'Tlaxcala', 'Veracruz', 'Yucatán', 'Zacatecas', 'Ciudad de México');

        INSERT INTO info (Nombre, Edad, Genero, Estado, Institución, Facultad, Padecimiento)
        VALUES (
            CONCAT(
                ELT(FLOOR(1 + RAND() * 10), 'Juan', 'José', 'Carlos', 'Luis', 'Miguel', 'María', 'Ana', 'Fernanda', 'Laura', 'Gabriela'), 
                ' ', 
                ELT(FLOOR(1 + RAND() * 10), 'García', 'Hernández', 'Martínez', 'López', 'Pérez', 'González', 'Sánchez', 'Ramírez', 'Cruz', 'Flores')
            ), 
            CASE 
                WHEN RAND() < 0.7 THEN FLOOR(18 + RAND() * 5)
                ELSE FLOOR(23 + RAND() * 3)
            END, 
            ELT(FLOOR(1 + RAND() * 2), 'Masculino', 'Femenino'),
            @estado,
            CASE 
                WHEN @estado = 'Aguascalientes' THEN 'Universidad Autónoma de Aguascalientes'
                WHEN @estado = 'Baja California' THEN 'Universidad Autónoma de Baja California'
                WHEN @estado = 'Ciudad de México' THEN 'Universidad Nacional Autónoma de México'
                ELSE 'Universidad Autónoma de México'
            END, 
            ELT(FLOOR(1 + RAND() * 8), 'Ingeniería', 'Medicina', 'Derecho', 'Arquitectura', 'Gastronomía', 'Ciencias Administrativas', 'Humanidades', 'Artes'), 
            CASE 
                WHEN RAND() < 0.3 THEN ELT(FLOOR(1 + RAND() * 3), 'TDAH', 'Ansiedad', 'Autismo')
                ELSE NULL 
            END
        );

        SET i = i + 1;
    END WHILE;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `Nombre` varchar(100) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Genero` enum('Masculino','Femenino') NOT NULL,
  `Estado` enum('Aguascalientes','Baja California','Baja California Sur','Campeche','Chiapas','Chihuahua','Ciudad de México','Coahuila','Colima','Durango','Estado de México','Guanajuato','Guerrero','Hidalgo','Jalisco','Michoacán','Morelos','Nayarit','Nuevo León','Oaxaca','Puebla','Querétaro','Quintana Roo','San Luis Potosí','Sinaloa','Sonora','Tabasco','Tamaulipas','Tlaxcala','Veracruz','Yucatán','Zacatecas') NOT NULL,
  `Institución` varchar(100) NOT NULL,
  `Facultad` enum('Ingeniería','Derecho','Arquitectura','Medicina','Ciencias Administrativas','Artes','Humanidedes','Gastronomía') NOT NULL,
  `Padecimiento` enum('Ansiedad','TDAH','Autismo','') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`Nombre`, `Edad`, `Genero`, `Estado`, `Institución`, `Facultad`, `Padecimiento`) VALUES
('Ana López', 22, 'Femenino', 'San Luis Potosí', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Laura Ramírez', 20, 'Femenino', 'Chiapas', 'Universidad Autónoma de México', 'Medicina', 'TDAH'),
('Gabriela Ramírez', 21, 'Femenino', 'Durango', 'Universidad Autónoma de México', 'Gastronomía', 'Ansiedad'),
('Luis García', 24, 'Masculino', 'Puebla', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Ana Hernández', 20, 'Femenino', 'Zacatecas', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('Carlos Hernández', 23, 'Femenino', 'Sonora', 'Universidad Autónoma de México', 'Medicina', 'Ansiedad'),
('Luis García', 20, 'Femenino', 'Nuevo León', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Luis López', 24, 'Masculino', 'Tamaulipas', 'Universidad Autónoma de México', 'Artes', 'TDAH'),
('Miguel González', 21, 'Femenino', 'Nuevo León', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Luis García', 22, 'Femenino', 'Yucatán', 'Universidad Autónoma de México', 'Artes', 'TDAH'),
('Laura García', 22, 'Masculino', 'Querétaro', 'Universidad Autónoma de México', '', 'Autismo'),
('Luis González', 18, 'Femenino', 'Estado de México', 'Universidad Autónoma de México', 'Derecho', NULL),
('María López', 19, 'Femenino', 'Nayarit', 'Universidad Autónoma de México', 'Artes', NULL),
('Miguel González', 18, 'Femenino', 'Chiapas', 'Universidad Autónoma de México', 'Medicina', NULL),
('Carlos Martínez', 20, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Arquitectura', NULL),
('Juan Flores', 18, 'Femenino', 'San Luis Potosí', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Carlos Ramírez', 20, 'Masculino', 'Nayarit', 'Universidad Autónoma de México', 'Medicina', NULL),
('José Pérez', 18, 'Masculino', 'Chihuahua', 'Universidad Autónoma de México', 'Medicina', NULL),
('Miguel Cruz', 23, 'Masculino', 'Tlaxcala', 'Universidad Autónoma de México', 'Arquitectura', 'TDAH'),
('Juan Martínez', 20, 'Femenino', 'Zacatecas', 'Universidad Autónoma de México', 'Derecho', NULL),
('José Martínez', 20, 'Femenino', 'Nuevo León', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('Miguel Cruz', 22, 'Femenino', 'Sinaloa', 'Universidad Autónoma de México', 'Artes', 'Ansiedad'),
('Carlos Ramírez', 24, 'Masculino', 'Veracruz', 'Universidad Autónoma de México', 'Derecho', 'Autismo'),
('Luis Hernández', 25, 'Masculino', 'Nuevo León', 'Universidad Autónoma de México', 'Artes', NULL),
('Laura García', 24, 'Masculino', 'Chiapas', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('Fernanda Flores', 20, 'Masculino', 'Veracruz', 'Universidad Autónoma de México', 'Derecho', 'TDAH'),
('Laura García', 19, 'Femenino', 'Baja California', 'Universidad Autónoma de Baja California', 'Artes', 'TDAH'),
('Fernanda López', 25, 'Femenino', 'Baja California Sur', 'Universidad Autónoma de México', 'Artes', NULL),
('Miguel García', 20, 'Masculino', 'Aguascalientes', 'Universidad Autónoma de Aguascalientes', 'Artes', NULL),
('Laura García', 20, 'Masculino', 'Sinaloa', 'Universidad Autónoma de México', 'Derecho', 'Autismo'),
('Luis Flores', 24, 'Masculino', 'Colima', 'Universidad Autónoma de México', 'Medicina', 'Autismo'),
('Gabriela Sánchez', 21, 'Masculino', 'Estado de México', 'Universidad Autónoma de México', 'Medicina', 'TDAH'),
('Ana Martínez', 20, 'Masculino', 'Zacatecas', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('Carlos García', 21, 'Femenino', 'Estado de México', 'Universidad Autónoma de México', 'Derecho', NULL),
('José Ramírez', 20, 'Femenino', 'Guanajuato', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Juan López', 18, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Ingeniería', 'Autismo'),
('Juan Ramírez', 25, 'Masculino', 'Campeche', 'Universidad Autónoma de México', 'Artes', NULL),
('Luis Martínez', 22, 'Masculino', 'Nuevo León', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('Gabriela García', 18, 'Masculino', 'Tamaulipas', 'Universidad Autónoma de México', 'Ciencias Administrativas', 'Autismo'),
('Ana Pérez', 19, 'Femenino', 'Puebla', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Ana Cruz', 19, 'Femenino', 'Jalisco', 'Universidad Autónoma de México', '', 'Ansiedad'),
('Miguel Hernández', 19, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Medicina', NULL),
('Ana Flores', 18, 'Masculino', 'Tamaulipas', 'Universidad Autónoma de México', 'Ingeniería', 'TDAH'),
('Gabriela Pérez', 20, 'Femenino', 'Estado de México', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Gabriela Pérez', 20, 'Femenino', 'Tamaulipas', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Ana Flores', 23, 'Femenino', 'Tabasco', 'Universidad Autónoma de México', 'Derecho', 'Autismo'),
('Laura Flores', 22, 'Masculino', 'Estado de México', 'Universidad Autónoma de México', 'Derecho', 'Ansiedad'),
('Miguel García', 20, 'Femenino', 'Querétaro', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('José Cruz', 23, 'Femenino', 'Puebla', 'Universidad Autónoma de México', 'Ingeniería', 'TDAH'),
('Juan López', 19, 'Masculino', 'Querétaro', 'Universidad Autónoma de México', 'Ingeniería', 'Ansiedad'),
('Fernanda Cruz', 20, 'Femenino', 'Guanajuato', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('Gabriela Ramírez', 23, 'Femenino', 'Guanajuato', 'Universidad Autónoma de México', 'Artes', 'Ansiedad'),
('Gabriela Martínez', 18, 'Femenino', 'Coahuila', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('Luis Martínez', 20, 'Masculino', 'Estado de México', 'Universidad Autónoma de México', 'Medicina', NULL),
('María González', 25, 'Femenino', 'Tabasco', 'Universidad Autónoma de México', 'Derecho', 'TDAH'),
('Gabriela Ramírez', 18, 'Femenino', 'Quintana Roo', 'Universidad Autónoma de México', '', 'Autismo'),
('Gabriela López', 25, 'Masculino', 'Coahuila', 'Universidad Autónoma de México', 'Medicina', NULL),
('José Sánchez', 19, 'Femenino', 'Estado de México', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('Carlos Sánchez', 24, 'Masculino', 'Tlaxcala', 'Universidad Autónoma de México', 'Medicina', 'Ansiedad'),
('Miguel Cruz', 23, 'Femenino', 'Chihuahua', 'Universidad Autónoma de México', 'Medicina', NULL),
('Carlos González', 21, 'Masculino', 'Nayarit', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('José Cruz', 23, 'Femenino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Artes', NULL),
('Miguel Sánchez', 23, 'Femenino', 'Durango', 'Universidad Autónoma de México', 'Medicina', NULL),
('Fernanda Ramírez', 19, 'Masculino', 'Guerrero', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('Laura Ramírez', 18, 'Masculino', 'Nayarit', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Carlos Sánchez', 21, 'Femenino', 'Veracruz', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Ana Flores', 23, 'Masculino', 'Sonora', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('María Martínez', 20, 'Masculino', 'Morelos', 'Universidad Autónoma de México', '', NULL),
('José López', 22, 'Masculino', 'Michoacán', 'Universidad Autónoma de México', 'Derecho', NULL),
('Carlos López', 18, 'Femenino', 'Veracruz', 'Universidad Autónoma de México', 'Ciencias Administrativas', NULL),
('María Ramírez', 18, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Ciencias Administrativas', 'Ansiedad'),
('Laura López', 21, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Medicina', 'Autismo'),
('Carlos Sánchez', 19, 'Masculino', 'Chihuahua', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('María Flores', 18, 'Femenino', 'Colima', 'Universidad Autónoma de México', 'Medicina', 'Ansiedad'),
('Laura Martínez', 23, 'Masculino', 'San Luis Potosí', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Ana Ramírez', 19, 'Femenino', 'Colima', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('Carlos González', 23, 'Femenino', 'Tamaulipas', 'Universidad Autónoma de México', 'Medicina', 'TDAH'),
('Luis López', 25, 'Masculino', 'Tamaulipas', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('Miguel Flores', 21, 'Femenino', 'Sinaloa', 'Universidad Autónoma de México', '', NULL),
('Miguel Martínez', 23, 'Masculino', 'Ciudad de México', 'Universidad Nacional Autónoma de México', 'Derecho', NULL),
('Miguel Cruz', 25, 'Femenino', 'Nuevo León', 'Universidad Autónoma de México', 'Ingeniería', NULL),
('María Sánchez', 19, 'Femenino', 'Michoacán', 'Universidad Autónoma de México', 'Medicina', 'Ansiedad'),
('Miguel Flores', 22, 'Femenino', 'Tabasco', 'Universidad Autónoma de México', 'Gastronomía', NULL),
('Luis García', 25, 'Masculino', 'Puebla', 'Universidad Autónoma de México', 'Ingeniería', 'Autismo'),
('Miguel Martínez', 20, 'Masculino', 'Baja California Sur', 'Universidad Autónoma de México', 'Ciencias Administrativas', 'TDAH'),
('Luis Martínez', 21, 'Masculino', 'Baja California Sur', 'Universidad Autónoma de México', 'Derecho', NULL),
('Luis Ramírez', 24, 'Femenino', 'Durango', 'Universidad Autónoma de México', 'Medicina', NULL),
('Gabriela Flores', 22, 'Femenino', 'Colima', 'Universidad Autónoma de México', '', 'Ansiedad'),
('Luis Hernández', 19, 'Masculino', 'Coahuila', 'Universidad Autónoma de México', 'Ciencias Administrativas', 'TDAH'),
('Juan Ramírez', 23, 'Masculino', 'Estado de México', 'Universidad Autónoma de México', 'Medicina', NULL),
('Ana Flores', 22, 'Masculino', 'Nayarit', 'Universidad Autónoma de México', '', NULL),
('Laura Pérez', 21, 'Masculino', 'Yucatán', 'Universidad Autónoma de México', 'Artes', NULL),
('María Sánchez', 20, 'Masculino', 'Hidalgo', 'Universidad Autónoma de México', 'Arquitectura', NULL),
('María Cruz', 25, 'Femenino', 'Durango', 'Universidad Autónoma de México', 'Derecho', 'Ansiedad'),
('Laura Pérez', 20, 'Masculino', 'Guanajuato', 'Universidad Autónoma de México', 'Medicina', NULL),
('Miguel Sánchez', 18, 'Femenino', 'Michoacán', 'Universidad Autónoma de México', 'Derecho', NULL),
('Miguel Hernández', 22, 'Femenino', 'Quintana Roo', 'Universidad Autónoma de México', 'Ingeniería', 'TDAH'),
('Gabriela Hernández', 20, 'Femenino', 'Zacatecas', 'Universidad Autónoma de México', 'Derecho', NULL),
('Gabriela Ramírez', 21, 'Femenino', 'Baja California', 'Universidad Autónoma de Baja California', 'Gastronomía', NULL),
('Ana Pérez', 20, 'Masculino', 'Guanajuato', 'Universidad Autónoma de México', '', 'TDAH');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
