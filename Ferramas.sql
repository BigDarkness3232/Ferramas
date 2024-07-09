-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 15-05-2024 a las 01:08:21
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ferramas`
--
CREATE DATABASE IF NOT EXISTS `Ferramas` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `Ferramas`;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` bigint(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'administrador'),
(1, 'cliente'),
(4, 'contador'),
(5,'bodeguero'),
(3, 'vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_permission`
--

CREATE TABLE `core_producto` (
  `id` bigint(20) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `id_marca` bigint(20) NOT NULL,
  `nombre_marca` varchar(100) not null,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

create TABLE `core_CarroProducto`(
  `id` bigint(20) NOT NULL,
  `producto` bigint(20) NOT NULL,
  `cantidad` bigint(20) NOT NULL,
  `usuario` bigint(20) NOT NULL

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;





CREATE TABLE `core_carrito` (
  `id` bigint(20) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `id_usuario_id` bigint(20) NOT NULL,
  `producto_carrito_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;
--
-- Volcado de datos para la tabla `core_carrito`
--
-- -------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_donacion`
--

CREATE TABLE `core_donacion` (
  `id` bigint(20) NOT NULL,
  `monto_a_donar` int(11) NOT NULL,
  `id_usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_estadoorden`
--

CREATE TABLE `core_estadoorden` (
  `id` bigint(20) NOT NULL,
  `estado_orden` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_estadoorden`
--

INSERT INTO `core_estadoorden` (`id`, `estado_orden`) VALUES
(1, 'validación'),
(2, 'preparación'),
(3, 'reparto'),
(4, 'entregado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_marca`
--

CREATE TABLE `core_marca` (
  `id` bigint(20) NOT NULL,
  `nombre_marca` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_marca`
--

INSERT INTO `core_marca` (`id`, `nombre_marca`) VALUES
(1, 'ferramas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_mensaje`
--

CREATE TABLE `core_mensaje` (
  `id` bigint(20) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(150) NOT NULL,
  `creado_en` date NOT NULL,
  `modificado_en` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_orden`
--

CREATE TABLE `core_orden` (
  `id` bigint(20) NOT NULL,
  `precio_orden` int(11) DEFAULT NULL,
  `creado_en` date NOT NULL,
  `modificado_en` date DEFAULT NULL,
  `descuento_sub` int(11) NOT NULL,
  `estado_orden_id` bigint(20) NOT NULL,
  `id_usuario_id` bigint(20) NOT NULL,
  `direccion_envio` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_ordenproducto`
--

CREATE TABLE `core_ordenproducto` (
  `id` bigint(20) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `orden_id` bigint(20) NOT NULL,
  `producto_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_producto`
--


--
-- Volcado de datos para la tabla `core_producto`
--


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_suscripcion`
--

CREATE TABLE `core_suscripcion` (
  `id` bigint(20) NOT NULL,
  `suscrito_el` date NOT NULL,
  `renovacion_el` date DEFAULT NULL,
  `id_usuario_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_tipoproducto`
--


-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `nombreTipoProducto`) VALUES
(1, 'herramientas electricas'),
(2, 'Herramientas para soldar'),
(3, 'herramientas generales'),
(4, 'clavos y tornillos'),
(5, 'productos de limpieza');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuario`
--

CREATE TABLE `core_usuario` (
  `id` bigint(20) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_usuario`
--

INSERT INTO `core_usuario` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `direccion`) VALUES
(1, 'pbkdf2_sha256$600000$nZ4t5kRpffZfikB5VWd252$izPHj/jtQuTAoMlccpxN1sZVG3CXDjwkWzQCgRYjSsY=', '2024-05-14 23:04:18.875145', 1, 'admin', 'admin', 'admin', 'fre.cardenas@duocuc.cl', 1, 1, '2023-06-24 05:45:36.000000', 'Hyrule 234'),
(4, 'pbkdf2_sha256$600000$xEQ7Nn78vLhH1mApbujqD6$gj9W8D9wQSrzCubinWEBvG/j9SVr2omRfHekP2jUMQk=', '2023-06-25 08:54:52.195836', 0, 'ArmorStand2', 'Alfredo', 'Turbina', 'alfredoturbina@gmail.com', 0, 1, '2023-06-24 07:45:48.495135', 'Rio mapocho numero 1122'),
(5, 'pbkdf2_sha256$600000$mH6BwwUjtt8LqV54kmPVDN$aVk4u2Bgn9sA03E9LhMG8Qo79iTA8GUMP9onUr0PloE=', '2023-06-25 09:00:02.041466', 0, 'VendeDoor', 'Jordan', 'Belfort', 'thewolf@wallstreet.com', 0, 1, '2023-06-24 08:02:28.000000', '1 Wall Street'),
(7, 'pbkdf2_sha256$600000$w1iXynrdVWoPMjaggUmTQn$Nr2CWYVXBXbz2b9ITkzfg8x29R52/d7yLsLetRjCYaY=', NULL, 0, 'elnegrou', 'freddy', 'cardenas', 'freddyacr02@gmail.com', 0, 1, '2024-05-14 23:01:59.592151', 'el reten'),
(8, 'pbkdf2_sha256$600000$2vGgXv9zB8MdGZV0otpdZr$HnvnRTzdU1W+hZ117K9ecR3DT4hTKR7iIolG26SdbEY=', '2024-05-14 23:03:57.246575', 0, 'freddy', 'freddy', 'cardenas', 'freddyacr02@gmail.com', 0, 1, '2024-05-14 23:02:15.000000', 'el reten');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuario_groups`
--

CREATE TABLE `core_usuario_groups` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_usuario_groups`
--

INSERT INTO `core_usuario_groups` (`id`, `usuario_id`, `group_id`) VALUES
(5, 1, 1),
(1, 1, 2),
(4, 1, 3),
(2, 4, 1),
(3, 5, 1),
(6, 5, 3),
(8, 7, 1),
(10, 8, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_usuario_user_permissions`
--

CREATE TABLE `core_usuario_user_permissions` (
  `id` bigint(20) NOT NULL,
  `usuario_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-06-24 07:14:39.157929', '1', 'Cliente', 1, '[{\"added\": {}}]', 3, 1),
(2, '2023-06-24 07:14:53.123396', '2', 'administrador', 1, '[{\"added\": {}}]', 3, 1),
(3, '2023-06-24 07:17:59.705638', '1', 'Cliente', 2, '[{\"changed\": {\"fields\": [\"Permissions\"]}}]', 3, 1),
(4, '2023-06-24 07:29:31.298282', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(5, '2023-06-24 07:29:36.322103', '1', 'cliente', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(6, '2023-06-24 07:39:24.424900', '2', 'ArmorStand', 3, '', 6, 1),
(7, '2023-06-24 08:27:16.380787', '3', 'vendor', 1, '[{\"added\": {}}]', 3, 1),
(8, '2023-06-24 08:27:43.611644', '3', 'vendedor', 2, '[{\"changed\": {\"fields\": [\"Name\"]}}]', 3, 1),
(9, '2023-06-24 08:27:52.587252', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(10, '2023-06-24 08:28:20.401072', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(11, '2023-06-24 08:28:26.530008', '5', 'VendeDoor', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(12, '2023-06-24 08:28:43.509833', '3', 'ArmorStand', 3, '', 6, 1),
(13, '2023-06-25 08:24:30.694575', '6', 'Pepe', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(14, '2024-05-14 23:03:25.562715', '8', 'freddy', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1),
(15, '2024-05-14 23:04:47.585467', '4', 'contador', 1, '[{\"added\": {}}]', 3, 1),
(16, '2024-05-14 23:05:52.418267', '3', 'vendedor', 2, '[]', 3, 1),
(17, '2024-05-14 23:06:13.164651', '4', 'contador', 2, '[]', 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_content_type`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_migrations`
--



-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('ndpxh5k5ay5n0rus11e5b9ohbjnkxt2e', '.eJxVjEsOwjAMBe-SNYqcfpKaJXvOUDm2SwookZp2hbg7VOoCtm9m3suMtK1p3Kou4yzmbJw5_W6R-KF5B3KnfCuWS16XOdpdsQet9lpEn5fD_TtIVNO3jgqAnlkn74KSdl5x0B5ajegwemla7gKEiTGIE-qxkaAI4IMMhGTeH_r5OEo:1qDLog:qdhygF2KYISVQo9SIGODc5nMMLFSHXjC6ddptu8SooM', '2023-07-09 09:13:54.820952'),
('xr7enfcjtolfb89xe9sbpmpsben2qfho', '.eJxVjEsOwjAMBe-SNYqcfpKaJXvOUDm2SwookZp2hbg7VOoCtm9m3suMtK1p3Kou4yzmbJw5_W6R-KF5B3KnfCuWS16XOdpdsQet9lpEn5fD_TtIVNO3jgqAnlkn74KSdl5x0B5ajegwemla7gKEiTGIE-qxkaAI4IMMhGTeH_r5OEo:1s71By:J4Ox_Mv4Tjdqj8BHYlgB_Kq2_gI-FCTo0kKhjmDKx4Q', '2024-05-28 23:04:18.878142');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indices de la tabla `auth_group_permissions`
--


--
-- Indices de la tabla `auth_permission`
--


--
-- Indices de la tabla `core_carrito`
--

--
-- Indices de la tabla `core_donacion`
--
ALTER TABLE `core_donacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_donacion_id_usuario_id_d847a9b9_fk_core_usuario_id` (`id_usuario_id`);

--
-- Indices de la tabla `core_estadoorden`
--
ALTER TABLE `core_estadoorden`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_marca`
--

--
-- Indices de la tabla `core_mensaje`
--
ALTER TABLE `core_mensaje`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_orden_estado_orden_id_6cc261ab_fk_core_estadoorden_id` (`estado_orden_id`),
  ADD KEY `core_orden_id_usuario_id_2ff524b5_fk_core_usuario_id` (`id_usuario_id`);

--
-- Indices de la tabla `core_ordenproducto`
--


--
-- Indices de la tabla `core_producto`
--
-- Indices de la tabla `core_tipoproducto`
--


--
-- Indices de la tabla `core_usuario`
--
ALTER TABLE `core_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indices de la tabla `core_usuario_groups`
--
ALTER TABLE `core_usuario_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_usuario_groups_usuario_id_group_id_bde3c750_uniq` (`usuario_id`,`group_id`),
  ADD KEY `core_usuario_groups_group_id_55312a9a_fk_auth_group_id` (`group_id`);

--
-- Indices de la tabla `core_usuario_user_permissions`
--

--
-- Indices de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_core_usuario_id` (`user_id`);

--
-- Indices de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indices de la tabla `django_migrations`
--


--
-- Indices de la tabla `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
--
-- AUTO_INCREMENT de la tabla `core_donacion`
--
ALTER TABLE `core_donacion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `core_estadoorden`
--
ALTER TABLE `core_estadoorden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `core_marca`
--
ALTER TABLE `core_marca`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `core_mensaje`
--
ALTER TABLE `core_mensaje`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `core_orden`
--
ALTER TABLE `core_orden`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `core_ordenproducto`
--
ALTER TABLE `core_ordenproducto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `core_producto`


--
-- AUTO_INCREMENT de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--

--
-- AUTO_INCREMENT de la tabla `core_usuario`
--
ALTER TABLE `core_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `core_usuario_groups`
--
ALTER TABLE `core_usuario_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `core_usuario_user_permissions`
--
ALTER TABLE `core_usuario_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `auth_group_permissions`
--

--
-- Filtros para la tabla `auth_permission`
--

--
-- Filtros para la tabla `core_carrito`
--

--
-- Filtros para la tabla `core_donacion`
--
ALTER TABLE `core_donacion`
  ADD CONSTRAINT `core_donacion_id_usuario_id_d847a9b9_fk_core_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `core_usuario` (`id`);

--
-- Filtros para la tabla `core_orden`
--
ALTER TABLE `core_orden`
  ADD CONSTRAINT `core_orden_estado_orden_id_6cc261ab_fk_core_estadoorden_id` FOREIGN KEY (`estado_orden_id`) REFERENCES `core_estadoorden` (`id`),
  ADD CONSTRAINT `core_orden_id_usuario_id_2ff524b5_fk_core_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `core_usuario` (`id`);

--
-- Filtros para la tabla `core_ordenproducto`
--

--
-- Filtros para la tabla `core_producto`
--

--
-- Filtros para la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD CONSTRAINT `core_suscripcion_id_usuario_id_6d081176_fk_core_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `core_usuario` (`id`);

--
-- Filtros para la tabla `core_usuario_groups`
--
ALTER TABLE `core_usuario_groups`
  ADD CONSTRAINT `core_usuario_groups_group_id_55312a9a_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `core_usuario_groups_usuario_id_97385234_fk_core_usuario_id` FOREIGN KEY (`usuario_id`) REFERENCES `core_usuario` (`id`);

--
-- Filtros para la tabla `core_usuario_user_permissions`

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_core_usuario_id` FOREIGN KEY (`user_id`) REFERENCES `core_usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
