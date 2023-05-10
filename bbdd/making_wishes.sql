--- LAS CONTRASEÑAS DE LOS USUARIOS 

---- a@a.es -> 12345678
---- b@b.es -> 87654321
---- c@c.es -> 12345678


-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 10, 2023 at 08:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `making_wishes`
--

-- --------------------------------------------------------

--
-- Table structure for table `added_users`
--

CREATE TABLE `added_users` (
  `id_user_1` int(7) NOT NULL,
  `id_user_2` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `added_users`
--

INSERT INTO `added_users` (`id_user_1`, `id_user_2`) VALUES
(1, 2),
(1, 3),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `groups`
--

CREATE TABLE `groups` (
  `id_group` int(7) NOT NULL,
  `id_user_owner` int(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `route_image` varchar(40) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `groups`
--

INSERT INTO `groups` (`id_group`, `id_user_owner`, `name`, `route_image`, `description`) VALUES
(1, 1, 'Mi cumpleaños', 'upload/16836443191366_2000.jpg', 'el día 30 de junio es mi cumpleaños y estos son los regalos que me gustaría tener :)'),
(2, 2, 'ascenso', 'upload/168365044920200325-Oficina.jpg', 'ospdfjasd');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id_item` int(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(1000) NOT NULL,
  `link` varchar(255) NOT NULL,
  `available` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id_item`, `name`, `description`, `link`, `available`) VALUES
(1, 'camiseta', 'camiseta azul', 'https://ae01.alicdn.com/kf/Hba002dc1786e444999644252dd730421H/Camiseta-de-flores-azules-para-mujer-remera-estampada-con-flores-en-3D-Camiseta-de-algod-n.jpg_Q90.jpg_.webp', 'yes'),
(2, 'camiseta azul', 'camiseta deflores', 'https://ae01.alicdn.com/kf/Hba002dc1786e444999644252dd730421H/Camiseta-de-flores-azules-para-mujer-remera-estampada-con-flores-en-3D-Camiseta-de-algod-n.jpg_Q90.jpg_.webp', 'no'),
(3, 'bloc de dibujo', 'bloc a5 para acuarelas', 'https://www.milbby.com/products/bloc-xl-acuarela-grano-fino-300gr-a5-canson?gclid=CjwKCAjw3ueiBhBmEiwA4BhspP3MsDOfcFtkOaJgsbhL7wDeGBCpEdlksU_nnaOi1M3-VGdNksAPIBoCBykQAvD_BwE', 'no'),
(4, 'pinceles de acuarela', 'El Set 6 Pinceles Técnicos de la marca Derwent es rico en la gran variedad de pinceles especialmente seleccionados para diferentes técnicas de pintura.', 'https://www.milbby.com/collections/all/products/set-6-pinceles-tecnicos-derwent?variant=41233609228480', 'yes'),
(5, 'Estuche de acuarelas', 'Estuche con 48 pastillas de acuarela especial iniciación, pincel rellenable y paleta extraíble, gama Creative Studio, de la marca Faber-Castell.', 'https://www.milbby.com/collections/all/products/estuche-48-pastillas-acuarela-creative-studio-faber-castell?variant=31856358457429', 'yes'),
(6, 'Estuche de lápices acuarelable', 'Estuche de metal con 120 lápices acuarelables Albrecht Dürer, de la marca Faber-Castell.', 'https://www.milbby.com/collections/all/products/estuche-metal-120-lapices-acuarelables-albrecht-durer-faber-castell?variant=31587632611413', 'yes'),
(7, 'Estuche de lápices acuarelable', 'Estuche de metal con 120 lápices acuarelables Albrecht Dürer, de la marca Faber-Castell.', 'https://www.milbby.com/collections/all/products/estuche-metal-120-lapices-acuarelables-albrecht-durer-faber-castell?variant=31587632611413', 'yes'),
(8, 'Estuche de lápices de color', 'Estuche de metal con 120 lápices acuarelables Albrecht Dürer, de la marca Faber-Castell.', 'https://www.milbby.com/collections/all/products/estuche-metal-120-lapices-acuarelables-albrecht-durer-faber-castell?variant=31587632611413', 'yes'),
(9, 'Set 75 Rotuladores Lettering', 'Esta megabox contiene 75 rotuladores Brushmarker Pro de Karin, con los 60 colores de la gama completa brushmarker + 12 colores neón + 3 blenders o mezcladores.', 'https://www.milbby.com/collections/all/products/set-75-rotuladores-lettering-brushmarker-pro-karin?variant=31856956342357', 'no'),
(10, 'Bloc Acuarela', 'Bloc Acuarela 15x25 Arches', 'https://www.milbby.com/collections/all/products/bloc-acuarela-15x25-arches?variant=43170445164736', 'yes'),
(11, 'Acetato', 'Acetato 30x30 Negativos Fotos Blanco Click Elena Roche', 'https://www.milbby.com/products/acetato-30x30-negativos-fotos-blanco-click-elena-roche?variant=46468117299547', 'yes'),
(12, 'Rotuladores', 'Caja 36 Rotuladores Acuarelables', 'https://www.milbby.com/products/caja-36-rotuladores-acuarelables-doble-punta-design-journey-staedtler?variant=43405408731328', 'yes'),
(13, 'vino', 'vino personalizado', 'https://regalador.com/es/73005/vino-tinto-personalizado-diseno-clasico-con-foto/', 'yes'),
(14, 'Pluma', 'Prima Forever de Pininfarina, el lápiz infinito', 'https://regalador.com/es/85363/prima-forever-de-pininfarina-el-lapiz-infinito/', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id_notif` int(7) NOT NULL,
  `added_user` int(7) NOT NULL,
  `adding_user` int(7) DEFAULT NULL,
  `id_group` int(7) DEFAULT NULL,
  `kind` enum('group','friendship') NOT NULL,
  `recibed` enum('yes','no') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id_notif`, `added_user`, `adding_user`, `id_group`, `kind`, `recibed`) VALUES
(8, 3, 1, NULL, 'friendship', 'yes'),
(9, 2, 1, NULL, 'friendship', 'yes'),
(10, 2, NULL, 0, 'group', 'yes'),
(11, 1, NULL, 2, 'group', 'yes'),
(12, 1, 2, NULL, 'friendship', 'yes'),
(13, 1, 2, NULL, 'friendship', 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(7) NOT NULL,
  `name` varchar(30) NOT NULL,
  `last_name_1` varchar(30) NOT NULL,
  `last_name_2` varchar(30) NOT NULL,
  `email` varchar(40) NOT NULL,
  `password` varchar(100) NOT NULL,
  `route_image` varchar(40) NOT NULL,
  `rol` enum('admin','wisher') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `name`, `last_name_1`, `last_name_2`, `email`, `password`, `route_image`, `rol`) VALUES
(1, 'Laura', 'Martín', 'Vicente', 'a@a.es', '73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', 'upload/1623415065chica.png', 'admin'),
(2, 'Jimena', 'Ruiz', 'Romero', 'b@b.es', '4k35IAeMPdTn6NJELwDlyasqIxuzkY1lzFCQbknsrvQ=', 'upload/1683743818otrachica.jpg', 'wisher'),
(3, 'Sergio', 'Rosal', 'Agustin', 'c@c.es', '73l8gRjwLftklgfdXT+MdiMEjJwGPVMsyVxe16iYpk8=', 'upload/1683645559chico1.jpg', 'wisher');

-- --------------------------------------------------------

--
-- Table structure for table `users_groups`
--

CREATE TABLE `users_groups` (
  `id_user` int(7) NOT NULL,
  `id_group` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users_groups`
--

INSERT INTO `users_groups` (`id_user`, `id_group`) VALUES
(1, 2),
(2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_groups`
--

CREATE TABLE `wish_list_groups` (
  `id_group` int(7) NOT NULL,
  `id_item` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wish_list_groups`
--

INSERT INTO `wish_list_groups` (`id_group`, `id_item`) VALUES
(0, 5),
(0, 8),
(0, 9);

-- --------------------------------------------------------

--
-- Table structure for table `wish_list_users`
--

CREATE TABLE `wish_list_users` (
  `id_user` int(7) NOT NULL,
  `id_item` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wish_list_users`
--

INSERT INTO `wish_list_users` (`id_user`, `id_item`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 10),
(2, 11),
(2, 12),
(3, 13),
(3, 14);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `added_users`
--
ALTER TABLE `added_users`
  ADD PRIMARY KEY (`id_user_1`,`id_user_2`),
  ADD KEY `FK_id_user_2` (`id_user_2`);

--
-- Indexes for table `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`id_group`),
  ADD KEY `FK_id_user_owner` (`id_user_owner`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id_item`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `FK_id_group` (`id_group`),
  ADD KEY `FK_added_user` (`adding_user`),
  ADD KEY `added_user` (`added_user`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`id_user`,`id_group`),
  ADD KEY `FK_id_group_user` (`id_group`);

--
-- Indexes for table `wish_list_groups`
--
ALTER TABLE `wish_list_groups`
  ADD PRIMARY KEY (`id_group`,`id_item`),
  ADD KEY `FK_id_item_gp` (`id_item`);

--
-- Indexes for table `wish_list_users`
--
ALTER TABLE `wish_list_users`
  ADD PRIMARY KEY (`id_user`,`id_item`),
  ADD KEY `FK_id_item` (`id_item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `groups`
--
ALTER TABLE `groups`
  MODIFY `id_group` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id_item` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id_notif` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(7) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `added_users`
--
ALTER TABLE `added_users`
  ADD CONSTRAINT `FK_id_user_1` FOREIGN KEY (`id_user_1`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_id_user_2` FOREIGN KEY (`id_user_2`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `groups`
--
ALTER TABLE `groups`
  ADD CONSTRAINT `FK_id_user_owner` FOREIGN KEY (`id_user_owner`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `FK_adding_user` FOREIGN KEY (`adding_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_id_group` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id_group`),
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`added_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `FK_id_group_user` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id_group`),
  ADD CONSTRAINT `FK_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);

--
-- Constraints for table `wish_list_groups`
--
ALTER TABLE `wish_list_groups`
  ADD CONSTRAINT `FK_id_item_gp` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`),
  ADD CONSTRAINT `FK_id_item_gp_` FOREIGN KEY (`id_group`) REFERENCES `groups` (`id_group`);

--
-- Constraints for table `wish_list_users`
--
ALTER TABLE `wish_list_users`
  ADD CONSTRAINT `FK_id_item` FOREIGN KEY (`id_item`) REFERENCES `items` (`id_item`),
  ADD CONSTRAINT `FK_id_user_wish` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  ADD CONSTRAINT `FK_id_user_wish_list` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
