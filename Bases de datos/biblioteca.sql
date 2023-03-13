-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 01-11-2021 a las 08:37:16
-- Versión del servidor: 8.0.21
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: biblioteca
--
DROP DATABASE IF EXISTS biblioteca;

CREATE DATABASE IF NOT EXISTS biblioteca  DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE biblioteca;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

DROP TABLE IF EXISTS `libros`;
CREATE TABLE IF NOT EXISTS `libros` (
  `IDL` int NOT NULL AUTO_INCREMENT,
  `ISBN` int NOT NULL,
  `Titulo` varchar(75) NOT NULL,
  `Autor` varchar(50) NOT NULL,
  PRIMARY KEY (`IDL`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`IDL`, `ISBN`, `Titulo`, `Autor`) VALUES
(1, 15648972, 'El juego de la oca', 'Toti Martinez de Lezea'),
(2, 15648973, 'El desorden que dejas', 'Carlos Montero'),
(3, 15648972, 'El silencio de la ciudad blanca', 'Eva Gª Sáenz de Urturi'),
(4, 15648973, 'Retrato en sepia', 'Isabel Allende'),
(5, 15648974, 'En el pais de la nube blanca', 'Sarah Lark'),
(6, 15648975, 'La chica del tren', 'Paula Hawkins'),
(7, 15648976, 'Los ritos del agua', 'Eva Gº Sáenz de Urturi'),
(8, 1564897, 'Esperando un respiro ', 'Terry McMillan');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ejemplares`
--

DROP TABLE IF EXISTS `ejemplares`;
CREATE TABLE IF NOT EXISTS `ejemplares` (
  `IdE` int NOT NULL,
  `IDL` int NOT NULL,
  `Biblioteca` varchar(75) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  PRIMARY KEY (IDE,IDL),
  CONSTRAINT fk_1 FOREIGN KEY(IdL) REFERENCES LIBROS(IdL) ON  DELETE CASCADE ON UPDATE CASCADE
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


--
-- Volcado de datos para la tabla `ejemplares`
--


INSERT INTO `ejemplares` (`IdE`, `IDL`, `Biblioteca`, `Estado`) VALUES
(0, 1, 'Estella', 'Bien'),
(1, 1, 'Puente La Reina', 'Defectuoso'),
(2, 2, 'Pamplona', ''),
(3, 2, 'Pamplona', ''),
(4, 2, 'Estella', 'Bien'),
(5, 3, 'Viana', 'Bien'),
(6, 4, 'Estella', 'Bien'),
(7, 4, 'Los Arcos', 'Bien'),
(8, 5, 'Viana', 'Bien'),
(9, 5, 'Los Arcos', 'Bien'),
(10, 6, 'Ancin', 'Bien'),
(11, 6, 'Zizur', 'Bien'),
(12, 7, 'Pamplona', 'Bien'),
(13, 7, 'Pamplona', 'Bien'),
(14, 8, 'Pamplona', 'Bien');

-- Permisos usuario gestor.
GRANT ALL ON biblioteca TO 'gestor'@'localhost';