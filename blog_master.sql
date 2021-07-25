-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 14, 2021 at 08:52 PM
-- Server version: 5.7.31
-- PHP Version: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blog_master`
--

-- --------------------------------------------------------

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`) VALUES
(1, 'Accion'),
(2, 'Rol'),
(3, 'Deportes'),
(4, 'plataformas'),
(5, 'Terror');

-- --------------------------------------------------------

--
-- Table structure for table `entradas`
--

DROP TABLE IF EXISTS `entradas`;
CREATE TABLE IF NOT EXISTS `entradas` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(255) NOT NULL,
  `categoria_id` int(255) NOT NULL,
  `titulo` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` mediumtext COLLATE latin1_spanish_ci,
  `fecha` date NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_entradas_usuario` (`usuario_id`),
  KEY `fk_entradas_categoria` (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `entradas`
--

INSERT INTO `entradas` (`id`, `usuario_id`, `categoria_id`, `titulo`, `descripcion`, `fecha`) VALUES
(1, 1, 1, 'Novedades GTA 5', 'Review GTA 5', '2020-09-10'),
(2, 1, 2, 'Review de LOL Online', 'Todo sobre LOL', '2020-09-10'),
(3, 1, 3, 'Nuevos jugadores de FIFA 20', 'Review de FIFA 20', '2020-09-10'),
(4, 2, 1, 'Novedades Assasings', 'Review Assasings', '2020-09-10'),
(5, 2, 2, 'Review de WOW Online', 'Todo sobre WOW', '2020-09-10'),
(6, 2, 3, 'Nuevos jugadores de PES 20', 'Review de PES 20', '2020-09-10'),
(7, 3, 1, 'Novedades Call of Duty', 'Review Call of Duty', '2020-09-10'),
(8, 3, 2, 'Review de FORNITE Online', 'Todo sobre FORNITE', '2020-09-10'),
(9, 3, 3, 'Nuevos jugadores de Formula 1 2k20', 'Review de Formula 1 2k20', '2020-09-10'),
(10, 6, 3, 'NBA', 'TODO SOBRE NBA GAME', '2020-09-14'),
(11, 3, 1, 'Guia de GTA vice city', 'GTA', '2020-09-17'),
(12, 7, 5, 'Resident Evil', 'Este juego es el de resident evil numero 3 en donde sale nemesis', '2021-07-14');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `apellidos` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `password` varchar(255) COLLATE latin1_spanish_ci NOT NULL,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `apellidos`, `email`, `password`, `fecha`) VALUES
(1, 'Carlos', 'sanchez', 'carlos@gmail.com', '1234', '2020-09-10'),
(2, 'Juan', 'Ramirez', 'juan@gmail.com', '1234', '2020-09-10'),
(3, 'Paco', 'Lopez', 'paco@gmail.com', '1234', '2020-09-10'),
(5, 'admin', 'admin', 'admin@admin.com', 'admin', '2020-09-10'),
(6, 'adrian', 'mendoza', 'mendoza@gmail.com', '1234567', '2020-09-14'),
(7, 'Carlos A', 'Sanchez ', 'flipunderflip123@gmail.com', '$2y$04$sVqycC2rbTHEMeQCVD5Qb.rL/TIk30EzmAq4HdannWyF4IhYjOXim', '2021-07-14');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `entradas`
--
ALTER TABLE `entradas`
  ADD CONSTRAINT `fk_entradas_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`),
  ADD CONSTRAINT `fk_entradas_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
