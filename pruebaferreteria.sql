-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-10-2020 a las 04:48:43
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pruebaferreteria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `codCli` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `pas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`codCli`, `nombre`, `correo`, `pas`) VALUES
(1, 'Jose Alonso', 'jose@gmail.com', 'abc123'),
(2, 'Diego Martinez', 'diego@gmail.com', 'abc456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallepedido`
--

CREATE TABLE `detallepedido` (
  `numPedido` int(11) NOT NULL,
  `codpro` int(11) NOT NULL,
  `can` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detallepedido`
--

INSERT INTO `detallepedido` (`numPedido`, `codpro`, `can`) VALUES
(1, 2, 2),
(1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `numPedido` int(11) NOT NULL,
  `codCli` varchar(100) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedido`
--

INSERT INTO `pedido` (`numPedido`, `codCli`, `fecha`) VALUES
(1, '2', '2020-01-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `codpro` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `precio` decimal(8,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `detalle` varchar(1000) NOT NULL,
  `imagen` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`codpro`, `descripcion`, `precio`, `stock`, `estado`, `detalle`, `imagen`) VALUES
(1, 'Taladro', '1800.00', 150, 'Normal', 'Taladro con punta de diamente de 45 pulgadas', 'Taladro.jpg'),
(2, 'Aplanadora', '1200.00', 20, 'Oferta', 'Aplanadora con fuerza de 90 pci', 'Aplanadora.jpg'),
(3, 'Martillo', '800.00', 30, 'Normal', 'Martillo de acero inoxidable con cabezal utral fuerte', 'Martillo.jpg'),
(4, 'Licuadora industrial', '400.00', 27, 'Normal', 'Licuadora de 10 velocidades con turbo', 'Licuadora.jpg'),
(5, 'mezcaldora', '300.00', 42, 'Oferta', 'Mezcladora doble funcion con desachadora de residuo', 'Mezcald.jpg'),
(6, 'Perforadora', '500.00', 16, 'Normal', 'Perforadora con punta de acero inoxidable', 'Perforadora.jpg'),
(7, 'Escavadora', '350.00', 26, 'Normal', 'Escavadora con pistones de titanio, especial para la construccion', 'Escavadora.jpg'),
(8, 'Laminas', '180.00', 22, 'Normal', 'Laminas hechas en aluminio con grosor de 17 cm', 'Laminas.jpg'),
(9, 'Hidro industrial', '2500.00', 10, 'Oferta', 'Hiroelectrica industrial multiuso con bomba de aire de 100 pci', 'prod3.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`codCli`);

--
-- Indices de la tabla `detallepedido`
--
ALTER TABLE `detallepedido`
  ADD KEY `numPedido` (`numPedido`),
  ADD KEY `codpro` (`codpro`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`numPedido`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`codpro`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `codCli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `numPedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `codpro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
