-- phpMyAdmin SQL Dump
-- version 4.9.5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Nov 27, 2020 at 07:03 AM
-- Server version: 5.7.24
-- PHP Version: 7.3.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `jobit`
--

-- --------------------------------------------------------

--
-- Table structure for table `affilies`
--

CREATE TABLE `affilies` (
  `id` int(11) NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` tinyint(1) NOT NULL,
  `created` datetime NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `affilies`
--

INSERT INTO `affilies` (`id`, `url`, `email`, `token`, `active`, `created`, `nom`) VALUES
(1, 'www.google.fr', 'lemail@mail.fr', NULL, 0, '2020-11-26 10:56:33', 'Julien'),
(2, 'lesitedeouf.com', 'lemail@lesupermail.fr', NULL, 0, '2020-11-26 10:05:11', 'PartTest');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `nom`) VALUES
(1, 'Design'),
(2, 'Développement'),
(3, 'categorie test');

-- --------------------------------------------------------

--
-- Table structure for table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20201123132102', '2020-11-23 17:36:50', 96),
('DoctrineMigrations\\Version20201123132548', '2020-11-23 17:36:50', 421),
('DoctrineMigrations\\Version20201123151220', '2020-11-23 17:36:50', 150),
('DoctrineMigrations\\Version20201126083611', '2020-11-26 08:36:22', 125),
('DoctrineMigrations\\Version20201126091944', '2020-11-26 09:19:48', 107),
('DoctrineMigrations\\Version20201126094857', '2020-11-26 09:49:01', 174);

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `categorie_id_id` int(11) NOT NULL,
  `contrat` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `entreprise` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pays` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lieu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `active` tinyint(1) NOT NULL,
  `expire` datetime NOT NULL,
  `created` datetime NOT NULL,
  `updated` datetime NOT NULL,
  `postuler` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `denomination` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `categorie_id_id`, `contrat`, `entreprise`, `logo`, `url`, `pays`, `lieu`, `description`, `token`, `email`, `active`, `expire`, `created`, `updated`, `postuler`, `denomination`) VALUES
(1, 1, 'Stage', 'Nasa', 'nasa.png', 'www.nasa.fr', 'USA', 'La lune', 'Cherche un stagiaire pour designer Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur porta maximus. Phasellus at dolor laoreet, tempus nisi sed, eleifend quam. Etiam lacinia nisl ac justo tempor, sed dictum ante venenatis. Cras pretium, augue vel suscipit volutpat, lorem tortor rutrum tellus, et ultricies nisi lectus ultrices tellus. Vivamus quis elit quis leo laoreet vulputate. Nulla faucibus non metus non pharetra. Donec scelerisque nec libero a ullamcorper. Vestibulum feugiat ornare arcu, vel tincidunt ipsum bibendum quis. Mauris ante eros, blandit sodales metus a, posuere dapibus lectus. Donec sem erat, varius id condimentum a, eleifend et erat. Maecenas massa nisl, laoreet ac.', '984\'9\"(84\'\"65(165\'\"1-65\"\'1gfdhd', 'nasa@mail.fr', 1, '2020-11-26 18:38:34', '2020-11-19 18:38:34', '2020-11-20 18:38:34', 'Pour postuler blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla ', 'Designer Web'),
(2, 2, 'CDD', 'Microsoft', 'microsoft.png', 'www.microsoft.fr', 'USA', 'Silicon Valley', 'Cherche un développeur web full-stack Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur porta maximus. Phasellus at dolor laoreet, tempus nisi sed, eleifend quam. Etiam lacinia nisl ac justo tempor, sed dictum ante venenatis. Cras pretium, augue vel suscipit volutpat, lorem tortor rutrum tellus, et ultricies nisi lectus ultrices tellus. Vivamus quis elit quis leo laoreet vulputate. Nulla faucibus non metus non pharetra. Donec scelerisque nec libero a ullamcorper. Vestibulum feugiat ornare arcu, vel tincidunt ipsum bibendum quis. Mauris ante eros, blandit sodales metus a, posuere dapibus lectus. Donec sem erat, varius id condimentum a, eleifend et erat. Maecenas massa nisl, laoreet ac.', 'ger56g14re5g165g1651\"\'6-t1\"\'6g16dr', 'microsoft@mail.fr', 1, '2020-11-26 18:38:34', '2020-11-19 18:38:34', '2020-11-20 18:38:34', 'Pour postuler bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla ', 'Développeur Full-stack'),
(3, 2, 'CDI', 'Google', 'google.jpg', 'www.google.fr', 'USA', 'GoogleVille', 'Cherche un développeur Java pour développer plein de truc Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean efficitur porta maximus. Phasellus at dolor laoreet, tempus nisi sed, eleifend quam. Etiam lacinia nisl ac justo tempor, sed dictum ante venenatis. Cras pretium, augue vel suscipit volutpat, lorem tortor rutrum tellus, et ultricies nisi lectus ultrices tellus. Vivamus quis elit quis leo laoreet vulputate. Nulla faucibus non metus non pharetra. Donec scelerisque nec libero a ullamcorper. Vestibulum feugiat ornare arcu, vel tincidunt ipsum bibendum quis. Mauris ante eros, blandit sodales metus a, posuere dapibus lectus. Donec sem erat, varius id condimentum a, eleifend et erat. Maecenas massa nisl, laoreet ac.', '654gf6d5g4df5g4df', 'google@mail.fr', 1, '2020-11-26 18:38:34', '2020-11-19 18:38:34', '2020-11-20 18:38:34', 'Pour postuler bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla blabla bla blablabla bla ', 'Développeur Java'),
(25, 1, 'CDI', 'Le cercle des Francs-Maçon', '20191211230049GW7o-5fbff4e943f91.jpeg', 'www.francsmacon.com', 'USA', 'Washington', 'bla blabla bla blablabla bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla              ', '91be60b9a6c18d1092673a6de1b2bb8321bc17e1b289b1bd76e6f56a8dcf4a47280ef23cc9cb8075795f06b86daabffa63ca', 'lemail@mail.fr', 0, '2020-12-26 18:33:13', '2020-11-26 18:33:13', '2020-11-26 18:33:13', 'Pour postuler bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  bla blabla bla blablabla  ', 'Designer Talentueux');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `roles`, `password`) VALUES
(1, 'admin', '[\"ROLE_ADMIN\"]', '$2y$13$2tkwJVyxnXZi8VyVxHOY.OrBtufeLLqWD5nO5xevltlWRq.rWNdUy');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `affilies`
--
ALTER TABLE `affilies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_A8936DC58A3C7387` (`categorie_id_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1483A5E9F85E0677` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `affilies`
--
ALTER TABLE `affilies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `FK_A8936DC58A3C7387` FOREIGN KEY (`categorie_id_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
