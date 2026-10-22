-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-08-2026 a las 00:54:02
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cafe_kode`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `estado` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id_categoria`, `nombre`, `descripcion`, `estado`) VALUES
(1, 'Cafés', 'Bebidas de café y preparaciones a base de café', 1),
(2, 'Bebidas', 'Bebidas frías y calientes', 1),
(3, 'Postres', 'Postres y productos dulces', 1),
(4, 'Panadería', 'Productos de panadería', 1),
(5, 'Desayunos', 'Opciones de desayuno', 1),
(6, 'Snacks', 'Snacks y productos para acompañar', 1),
(7, 'Bebidas', 'Bebidas frías y calientes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `informacion_nutricional`
--

CREATE TABLE `informacion_nutricional` (
  `id_nutricion` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `porcion` varchar(50) DEFAULT NULL,
  `calorias` int(11) DEFAULT NULL,
  `grasas` decimal(6,2) DEFAULT NULL,
  `proteinas` decimal(6,2) DEFAULT NULL,
  `carbohidratos` decimal(6,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `informacion_nutricional`
--

INSERT INTO `informacion_nutricional` (`id_nutricion`, `producto_id`, `porcion`, `calorias`, `grasas`, `proteinas`, `carbohidratos`) VALUES
(1, 1, '300g', 350, 8.00, 9.00, 60.00),
(2, 2, '220g', 290, 7.00, 8.00, 45.00),
(3, 3, '90g', 220, 10.00, 4.00, 30.00),
(4, 4, '60g', 180, 7.00, 3.00, 26.00),
(5, 6, '300ml', 120, 3.00, 2.00, 18.00),
(6, 7, '350ml', 140, 2.00, 3.00, 28.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `cliente_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `cliente_id`, `fecha`, `total`) VALUES
(1, 1, '2026-07-23', 56.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id_productos` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `stock` int(11) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `disponible` tinyint(1) DEFAULT 1,
  `fecha_creacion` datetime DEFAULT current_timestamp(),
  `fecha_actualizacion` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `ingredientes` text DEFAULT NULL,
  `en_oferta` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id_productos`, `nombre`, `precio`, `stock`, `descripcion`, `categoria_id`, `imagen`, `disponible`, `fecha_creacion`, `fecha_actualizacion`, `ingredientes`, `en_oferta`) VALUES
(1, 'Bowl Energetico', 18.00, 8, 'Granola\r\nBanana\r\nFresas\r\nKiwi\r\nYogurt de coco\r\nSemillas de chia', 5, 'desayunos/bolw.jpg', 1, '2026-08-18 16:37:16', '2026-08-18 17:36:26', 'Granola, Banano, Fresas, Kiwi, Yogurt de coco, Semillas de chía', 1),
(2, 'Tostada de Avena', 15.00, 5, NULL, 5, 'desayunos/tostada.jpg', 1, '2026-08-18 16:37:16', '2026-08-18 17:36:26', 'Pan de avena, Aguacate, Tomate, Peregil, Aceite de oliva, Sal marina', 0),
(3, 'Brownie vegano', 9.00, 2, NULL, 6, 'snacks/brownie.jpg', 1, '2026-08-18 16:37:16', '2026-08-18 17:36:26', 'Cacao, Harina integral, Azúcar mascabado, Aceite de coco', 1),
(4, 'Galleta choco-chip', 7.00, 0, NULL, 6, 'snacks/galletas.jpg', 1, '2026-08-18 16:37:16', '2026-08-18 17:36:26', 'Harina, Chispas de chocolate veganas, Azúcar, Aceite vegetal', 0),
(6, 'latte', 8000.00, 10, 'café latte preparado con leche', 7, 'bebidas/latte.png', 1, '2026-08-18 16:57:49', '2026-08-18 17:36:26', 'Espresso, Leche de avena, Canela', 0),
(7, 'Smoothie Verde', 13000.00, 10, 'Espinaca, manzana y jengibre.', 7, 'bebidas/smoothue.jpeg', 1, '2026-08-18 17:41:35', '2026-08-18 17:41:35', 'Espinaca, Manzana, Piña, Jengibre', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_rol` int(11) NOT NULL,
  `nombre_rol` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_rol`, `nombre_rol`) VALUES
(1, 'administrador'),
(2, 'empleado'),
(3, 'cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id_usuario` int(11) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `apellido` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contraseña` varchar(150) NOT NULL,
  `telefono` varchar(150) NOT NULL,
  `direccion` varchar(150) NOT NULL,
  `foto_perfil` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id_usuario`, `rol_id`, `nombre`, `apellido`, `email`, `contraseña`, `telefono`, `direccion`, `foto_perfil`) VALUES
(1, 1, 'taehyung', 'kim', 'thv@gmail.com', 'vantee3070', '21432142', '457587687', 'foto_perfil.jpg');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkpedido_detalle` (`pedido_id`),
  ADD KEY `fkdetalle_producto` (`producto_id`);

--
-- Indices de la tabla `informacion_nutricional`
--
ALTER TABLE `informacion_nutricional`
  ADD PRIMARY KEY (`id_nutricion`),
  ADD KEY `fk_nutricion_producto` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fkpedido_usuario` (`cliente_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id_productos`),
  ADD KEY `fk_productos_categoria` (`categoria_id`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_rol`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id_usuario`),
  ADD KEY `fkusuario_rol` (`rol_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `informacion_nutricional`
--
ALTER TABLE `informacion_nutricional`
  MODIFY `id_nutricion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id_productos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fkdetalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_productos`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fkpedido_detalle` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `informacion_nutricional`
--
ALTER TABLE `informacion_nutricional`
  ADD CONSTRAINT `fk_nutricion_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id_productos`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fkpedido_usuario` FOREIGN KEY (`cliente_id`) REFERENCES `usuarios` (`id_usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id_categoria`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fkusuario_rol` FOREIGN KEY (`rol_id`) REFERENCES `roles` (`id_rol`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
