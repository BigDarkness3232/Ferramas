-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-06-2023 a las 11:24:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `web_blume`
--
CREATE DATABASE IF NOT EXISTS `web_blume` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci;
USE `web_blume`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(2, 'administrador'),
(1, 'cliente'),
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

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(1, 1, 17),
(2, 1, 18),
(3, 1, 19),
(4, 1, 20),
(5, 1, 21),
(6, 1, 22),
(7, 1, 24),
(8, 1, 28),
(9, 1, 32),
(10, 1, 36),
(11, 1, 40),
(12, 1, 44),
(13, 1, 45),
(14, 1, 46),
(15, 1, 47),
(16, 1, 48),
(17, 1, 52),
(18, 1, 53),
(19, 1, 54),
(20, 1, 55),
(21, 1, 56),
(82, 1, 60),
(22, 2, 1),
(23, 2, 2),
(24, 2, 3),
(25, 2, 4),
(26, 2, 5),
(27, 2, 6),
(28, 2, 7),
(29, 2, 8),
(30, 2, 9),
(31, 2, 10),
(32, 2, 11),
(33, 2, 12),
(34, 2, 13),
(35, 2, 14),
(36, 2, 15),
(37, 2, 16),
(38, 2, 17),
(39, 2, 18),
(40, 2, 19),
(41, 2, 20),
(42, 2, 21),
(43, 2, 22),
(44, 2, 23),
(45, 2, 24),
(46, 2, 25),
(47, 2, 26),
(48, 2, 27),
(49, 2, 28),
(50, 2, 29),
(51, 2, 30),
(52, 2, 31),
(53, 2, 32),
(54, 2, 33),
(55, 2, 34),
(56, 2, 35),
(57, 2, 36),
(58, 2, 37),
(59, 2, 38),
(60, 2, 39),
(61, 2, 40),
(62, 2, 41),
(63, 2, 42),
(64, 2, 43),
(65, 2, 44),
(66, 2, 45),
(67, 2, 46),
(68, 2, 47),
(69, 2, 48),
(70, 2, 49),
(71, 2, 50),
(72, 2, 51),
(73, 2, 52),
(74, 2, 53),
(75, 2, 54),
(76, 2, 55),
(77, 2, 56),
(78, 2, 57),
(79, 2, 58),
(80, 2, 59),
(81, 2, 60),
(83, 3, 25),
(84, 3, 26),
(85, 3, 27),
(86, 3, 28),
(87, 3, 29),
(88, 3, 30),
(89, 3, 31),
(90, 3, 32),
(91, 3, 33),
(92, 3, 34),
(93, 3, 35),
(94, 3, 36),
(95, 3, 37),
(96, 3, 38),
(97, 3, 39),
(98, 3, 40),
(99, 3, 41),
(100, 3, 42),
(101, 3, 43),
(102, 3, 44),
(103, 3, 45),
(104, 3, 46),
(105, 3, 47),
(106, 3, 48),
(107, 3, 49),
(108, 3, 50),
(109, 3, 51),
(110, 3, 52);

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

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add content type', 4, 'add_contenttype'),
(14, 'Can change content type', 4, 'change_contenttype'),
(15, 'Can delete content type', 4, 'delete_contenttype'),
(16, 'Can view content type', 4, 'view_contenttype'),
(17, 'Can add session', 5, 'add_session'),
(18, 'Can change session', 5, 'change_session'),
(19, 'Can delete session', 5, 'delete_session'),
(20, 'Can view session', 5, 'view_session'),
(21, 'Can add user', 6, 'add_usuario'),
(22, 'Can change user', 6, 'change_usuario'),
(23, 'Can delete user', 6, 'delete_usuario'),
(24, 'Can view user', 6, 'view_usuario'),
(25, 'Can add estado orden', 7, 'add_estadoorden'),
(26, 'Can change estado orden', 7, 'change_estadoorden'),
(27, 'Can delete estado orden', 7, 'delete_estadoorden'),
(28, 'Can view estado orden', 7, 'view_estadoorden'),
(29, 'Can add marca', 8, 'add_marca'),
(30, 'Can change marca', 8, 'change_marca'),
(31, 'Can delete marca', 8, 'delete_marca'),
(32, 'Can view marca', 8, 'view_marca'),
(33, 'Can add mensaje', 9, 'add_mensaje'),
(34, 'Can change mensaje', 9, 'change_mensaje'),
(35, 'Can delete mensaje', 9, 'delete_mensaje'),
(36, 'Can view mensaje', 9, 'view_mensaje'),
(37, 'Can add orden', 10, 'add_orden'),
(38, 'Can change orden', 10, 'change_orden'),
(39, 'Can delete orden', 10, 'delete_orden'),
(40, 'Can view orden', 10, 'view_orden'),
(41, 'Can add tipo producto', 11, 'add_tipoproducto'),
(42, 'Can change tipo producto', 11, 'change_tipoproducto'),
(43, 'Can delete tipo producto', 11, 'delete_tipoproducto'),
(44, 'Can view tipo producto', 11, 'view_tipoproducto'),
(45, 'Can add suscripcion', 12, 'add_suscripcion'),
(46, 'Can change suscripcion', 12, 'change_suscripcion'),
(47, 'Can delete suscripcion', 12, 'delete_suscripcion'),
(48, 'Can view suscripcion', 12, 'view_suscripcion'),
(49, 'Can add producto', 13, 'add_producto'),
(50, 'Can change producto', 13, 'change_producto'),
(51, 'Can delete producto', 13, 'delete_producto'),
(52, 'Can view producto', 13, 'view_producto'),
(53, 'Can add carrito', 14, 'add_carrito'),
(54, 'Can change carrito', 14, 'change_carrito'),
(55, 'Can delete carrito', 14, 'delete_carrito'),
(56, 'Can view carrito', 14, 'view_carrito'),
(57, 'Can add orden producto', 15, 'add_ordenproducto'),
(58, 'Can change orden producto', 15, 'change_ordenproducto'),
(59, 'Can delete orden producto', 15, 'delete_ordenproducto'),
(60, 'Can view orden producto', 15, 'view_ordenproducto'),
(61, 'Can add donacion', 16, 'add_donacion'),
(62, 'Can change donacion', 16, 'change_donacion'),
(63, 'Can delete donacion', 16, 'delete_donacion'),
(64, 'Can view donacion', 16, 'view_donacion');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `core_carrito`
--

CREATE TABLE `core_carrito` (
  `id` bigint(20) NOT NULL,
  `cantidad_prod` int(11) NOT NULL,
  `id_usuario_id` bigint(20) NOT NULL,
  `producto_carrito_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

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
(1, 'Blume');

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

CREATE TABLE `core_producto` (
  `id` bigint(20) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `precio` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `creado_en` date NOT NULL,
  `modificado_en` date NOT NULL,
  `marca_id` bigint(20) NOT NULL,
  `tipo_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_producto`
--

INSERT INTO `core_producto` (`id`, `imagen`, `nombre`, `descripcion`, `precio`, `stock`, `creado_en`, `modificado_en`, `marca_id`, `tipo_id`) VALUES
(2, 'productos/arb-nube.jpg', 'Arbusto Nube', 'Arbusto Nube', 2222, 5, '2023-06-06', '2023-06-25', 1, 1),
(3, 'productos/arkein.webp', 'Arbusto Arbusto', 'Arbusto Arbusto', 2222, 2, '2023-06-06', '2023-06-25', 1, 1),
(4, 'productos/cultivador-jardin.webp', 'Cultivador', 'Cultivador', 5900, 10, '2023-06-06', '2023-06-25', 1, 5),
(5, 'productos/flor.jpg', 'Flor Loto', 'Flor Loto', 6666, 10, '2023-06-06', '2023-06-25', 1, 2),
(6, 'productos/Flor4.webp', 'Girasoles', 'Girasoles', 990, 14, '2023-06-06', '2023-06-25', 1, 2),
(7, 'productos/mac5.jpg', 'Macetero bob patiño', 'Macetero bob patiño', 9990, 10, '2023-06-06', '2023-06-25', 1, 4),
(8, 'productos/mac6.jpg', 'Cilindro Cyan', 'Macetero Cilindro Cyan', 9900, 10, '2023-06-06', '2023-06-25', 1, 4),
(9, 'productos/tijeras-poda.webp', 'Tijera poda', 'Tijera poda', 6990, 8, '2023-06-06', '2023-06-25', 1, 5),
(10, 'productos/th3.jpg', 'Sustrato rejuvenedor', 'Sustrato rejuvenedor', 15990, 10, '2023-06-06', '2023-06-25', 1, 3),
(11, 'productos/th3_UZrHTlh.jpg', 'Tierra de Hojas', 'Tierra de Hojas organico', 15990, 10, '2023-06-06', '2023-06-25', 1, 3);

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

CREATE TABLE `core_tipoproducto` (
  `id` bigint(20) NOT NULL,
  `nombreTipoProducto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `core_tipoproducto`
--

INSERT INTO `core_tipoproducto` (`id`, `nombreTipoProducto`) VALUES
(1, 'Arbustos'),
(2, 'Flores'),
(3, 'Sustratos'),
(4, 'Maceteros'),
(5, 'Herramientas');

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
(1, 'pbkdf2_sha256$600000$nZ4t5kRpffZfikB5VWd252$izPHj/jtQuTAoMlccpxN1sZVG3CXDjwkWzQCgRYjSsY=', '2023-06-25 09:13:54.814555', 1, 'admin', 'admin', 'admin', 'ig.cordero@duocuc.cl', 1, 1, '2023-06-24 05:45:36.000000', 'Hyrule 234'),
(4, 'pbkdf2_sha256$600000$xEQ7Nn78vLhH1mApbujqD6$gj9W8D9wQSrzCubinWEBvG/j9SVr2omRfHekP2jUMQk=', '2023-06-25 08:54:52.195836', 0, 'ArmorStand2', 'Alfredo', 'Turbina', 'alfredoturbina@gmail.com', 0, 1, '2023-06-24 07:45:48.495135', 'Rio mapocho numero 1122'),
(5, 'pbkdf2_sha256$600000$mH6BwwUjtt8LqV54kmPVDN$aVk4u2Bgn9sA03E9LhMG8Qo79iTA8GUMP9onUr0PloE=', '2023-06-25 09:00:02.041466', 0, 'VendeDoor', 'Jordan', 'Belfort', 'thewolf@wallstreet.com', 0, 1, '2023-06-24 08:02:28.000000', '1 Wall Street');

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
(6, 5, 3);

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
(13, '2023-06-25 08:24:30.694575', '6', 'Pepe', 2, '[{\"changed\": {\"fields\": [\"Groups\"]}}]', 6, 1);

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

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'contenttypes', 'contenttype'),
(14, 'core', 'carrito'),
(16, 'core', 'donacion'),
(7, 'core', 'estadoorden'),
(8, 'core', 'marca'),
(9, 'core', 'mensaje'),
(10, 'core', 'orden'),
(15, 'core', 'ordenproducto'),
(13, 'core', 'producto'),
(12, 'core', 'suscripcion'),
(11, 'core', 'tipoproducto'),
(6, 'core', 'usuario'),
(5, 'sessions', 'session');

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

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-06-24 05:43:45.762771'),
(2, 'contenttypes', '0002_remove_content_type_name', '2023-06-24 05:43:45.802929'),
(3, 'auth', '0001_initial', '2023-06-24 05:43:45.989068'),
(4, 'auth', '0002_alter_permission_name_max_length', '2023-06-24 05:43:46.025728'),
(5, 'auth', '0003_alter_user_email_max_length', '2023-06-24 05:43:46.030106'),
(6, 'auth', '0004_alter_user_username_opts', '2023-06-24 05:43:46.034610'),
(7, 'auth', '0005_alter_user_last_login_null', '2023-06-24 05:43:46.039378'),
(8, 'auth', '0006_require_contenttypes_0002', '2023-06-24 05:43:46.042239'),
(9, 'auth', '0007_alter_validators_add_error_messages', '2023-06-24 05:43:46.045419'),
(10, 'auth', '0008_alter_user_username_max_length', '2023-06-24 05:43:46.048635'),
(11, 'auth', '0009_alter_user_last_name_max_length', '2023-06-24 05:43:46.051115'),
(12, 'auth', '0010_alter_group_name_max_length', '2023-06-24 05:43:46.099751'),
(13, 'auth', '0011_update_proxy_permissions', '2023-06-24 05:43:46.104605'),
(14, 'auth', '0012_alter_user_first_name_max_length', '2023-06-24 05:43:46.107605'),
(15, 'core', '0001_initial', '2023-06-24 05:43:46.846978'),
(16, 'admin', '0001_initial', '2023-06-24 05:43:46.939609'),
(17, 'admin', '0002_logentry_remove_auto_add', '2023-06-24 05:43:46.949602'),
(18, 'admin', '0003_logentry_add_action_flag_choices', '2023-06-24 05:43:46.955365'),
(19, 'sessions', '0001_initial', '2023-06-24 05:43:46.975573'),
(20, 'core', '0002_alter_usuario_direccion', '2023-06-24 07:29:11.599385'),
(21, 'core', '0003_orden_direccion_envio', '2023-06-24 20:41:34.075059'),
(22, 'core', '0004_donacion', '2023-06-25 04:29:53.392768'),
(23, 'core', '0005_rename_monto_donado_donacion_monto_a_donar', '2023-06-25 04:46:02.709025'),
(24, 'core', '0006_alter_orden_creado_en_alter_orden_modificado_en', '2023-06-25 08:35:04.843705'),
(25, 'core', '0007_alter_orden_creado_en_alter_orden_modificado_en_and_more', '2023-06-25 08:45:36.903344');

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
('ndpxh5k5ay5n0rus11e5b9ohbjnkxt2e', '.eJxVjEsOwjAMBe-SNYqcfpKaJXvOUDm2SwookZp2hbg7VOoCtm9m3suMtK1p3Kou4yzmbJw5_W6R-KF5B3KnfCuWS16XOdpdsQet9lpEn5fD_TtIVNO3jgqAnlkn74KSdl5x0B5ajegwemla7gKEiTGIE-qxkaAI4IMMhGTeH_r5OEo:1qDLog:qdhygF2KYISVQo9SIGODc5nMMLFSHXjC6ddptu8SooM', '2023-07-09 09:13:54.820952');

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
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indices de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indices de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_carrito_id_usuario_id_a8530b01_fk_core_usuario_id` (`id_usuario_id`),
  ADD KEY `core_carrito_producto_carrito_id_45e226fd_fk_core_producto_id` (`producto_carrito_id`);

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
ALTER TABLE `core_marca`
  ADD PRIMARY KEY (`id`);

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
ALTER TABLE `core_ordenproducto`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_ordenproducto_orden_id_producto_id_a51afedc_uniq` (`orden_id`,`producto_id`),
  ADD KEY `core_ordenproducto_producto_id_5b9951d7_fk_core_producto_id` (`producto_id`);

--
-- Indices de la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_producto_marca_id_b2651e7a_fk_core_marca_id` (`marca_id`),
  ADD KEY `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` (`tipo_id`);

--
-- Indices de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `core_suscripcion_id_usuario_id_6d081176_fk_core_usuario_id` (`id_usuario_id`);

--
-- Indices de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  ADD PRIMARY KEY (`id`);

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
ALTER TABLE `core_usuario_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `core_usuario_user_permis_usuario_id_permission_id_7a048d24_uniq` (`usuario_id`,`permission_id`),
  ADD KEY `core_usuario_user_pe_permission_id_7f881653_fk_auth_perm` (`permission_id`);

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
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT de la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
ALTER TABLE `core_producto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `core_suscripcion`
--
ALTER TABLE `core_suscripcion`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `core_tipoproducto`
--
ALTER TABLE `core_tipoproducto`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `core_usuario`
--
ALTER TABLE `core_usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `core_usuario_groups`
--
ALTER TABLE `core_usuario_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `core_usuario_user_permissions`
--
ALTER TABLE `core_usuario_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `core_carrito`
--
ALTER TABLE `core_carrito`
  ADD CONSTRAINT `core_carrito_id_usuario_id_a8530b01_fk_core_usuario_id` FOREIGN KEY (`id_usuario_id`) REFERENCES `core_usuario` (`id`),
  ADD CONSTRAINT `core_carrito_producto_carrito_id_45e226fd_fk_core_producto_id` FOREIGN KEY (`producto_carrito_id`) REFERENCES `core_producto` (`id`);

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
ALTER TABLE `core_ordenproducto`
  ADD CONSTRAINT `core_ordenproducto_orden_id_97cf6a78_fk_core_orden_id` FOREIGN KEY (`orden_id`) REFERENCES `core_orden` (`id`),
  ADD CONSTRAINT `core_ordenproducto_producto_id_5b9951d7_fk_core_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `core_producto` (`id`);

--
-- Filtros para la tabla `core_producto`
--
ALTER TABLE `core_producto`
  ADD CONSTRAINT `core_producto_marca_id_b2651e7a_fk_core_marca_id` FOREIGN KEY (`marca_id`) REFERENCES `core_marca` (`id`),
  ADD CONSTRAINT `core_producto_tipo_id_e0e92ad1_fk_core_tipoproducto_id` FOREIGN KEY (`tipo_id`) REFERENCES `core_tipoproducto` (`id`);

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
ALTER TABLE `core_usuario_user_permissions`
  ADD CONSTRAINT `core_usuario_user_pe_permission_id_7f881653_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `core_usuario_user_pe_usuario_id_ce4108a7_fk_core_usua` FOREIGN KEY (`usuario_id`) REFERENCES `core_usuario` (`id`);

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
