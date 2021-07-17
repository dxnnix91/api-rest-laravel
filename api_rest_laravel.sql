-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 17-07-2021 a las 16:23:12
-- Versión del servidor: 5.7.31
-- Versión de PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `api_rest_laravel`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Frameworks', '2021-06-18 15:42:10', '2021-06-25 15:42:10');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `posts`
--

DROP TABLE IF EXISTS `posts`;
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `user_id` int(255) NOT NULL,
  `category_id` int(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_post_user` (`user_id`),
  KEY `fk_post_category` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `posts`
--

INSERT INTO `posts` (`id`, `user_id`, `category_id`, `title`, `content`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '\r\n¿Qué es Laravel?', 'Publicado el 11/12/2015 por Fernán García de Zúñiga en Programación y BBDD Compartir: Email Facebook LinkedIn Twitter\r\nLaravel - Taylor Otwell - laravel.comLaravel es uno de los frameworks de código abierto más fáciles de asimilar para PHP. Es simple, muy potente y tiene una interfaz elegante y divertida de usar. Fue creado en 2011 y tiene una gran influencia de frameworks como Ruby on Rails, Sinatra y ASP.NET MVC.\r\n\r\nEn este artículo, explicamos las principales ventajas y nuevas funcionalidades de Laravel 5.', NULL, NULL, NULL),
(2, 1, 1, '¿Qué es Symfony? Y por qué es el mejor framework para crear aplicaciones web', 'Symfony es un entorno de trabajo estandarizado (framework PHP) que se utiliza para el desarrollo de aplicaciones web y es de los más utilizados en el entorno de desarrolladores de apps. En otras palabras, es una herramienta para desarrolladores para crear aplicaciones en PHP.\r\n\r\nLa empresa creadora de este framework fue SensioLabs y es utilizada actualmente por miles de empresas de desarrollo web en todo el mundo.\r\n\r\nUna de las principales ventajas de Symfony es que posee una licencia MIT, o lo que es lo mismo que una licencia de software libre permisivo, que se puede utilizar dentro del software del propietario y al no poseer Copywright permite su modificación.\r\n\r\nLa primera versión de Symfony se creo en octubre de 2005 y una de sus curiosidades es que Yahoo lo eligió como su framework PHP de desarrollo, con el que contruyó Yahoo Bookmarks.', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `surname` varchar(100) DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `description` text,
  `image` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `role`, `email`, `password`, `description`, `image`, `created_at`, `updated_at`, `remember_token`) VALUES
(1, 'admin', 'admin', 'ROLE_ADMIN', 'admin@admin.com', 'admin', 'Descripcion del admin', NULL, NULL, NULL, NULL);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_post_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_post_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
