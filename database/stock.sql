-- phpMyAdmin SQL Dump
-- version 5.1.4
--
-- Host: mysql-dpstudio.alwaysdata.net
-- Generation Time: Oct 18, 2022 at 11:39 AM
-- Server version: 10.5.16-MariaDB
-- PHP Version: 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Stock`
--

-- --------------------------------------------------------

--
-- Table structure for table `cultures`
--

CREATE TABLE `cultures` (
  `id` int(11) NOT NULL,
  `type_culture` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `cultures`
--

INSERT INTO `cultures` (`id`, `type_culture`) VALUES
(1, 'Traditionnelle'),
(2, 'Raisonnée'),
(3, 'Ecologique'),
(4, 'Bio');

-- --------------------------------------------------------

--
-- Table structure for table `departements`
--

CREATE TABLE `departements` (
  `id` int(11) NOT NULL,
  `name_departement` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `initial` varchar(2) COLLATE utf8_unicode_ci NOT NULL,
  `departement_created_at` date NOT NULL DEFAULT current_timestamp(),
  `departement_updated_at` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `departements`
--

INSERT INTO `departements` (`id`, `name_departement`, `initial`, `departement_created_at`, `departement_updated_at`) VALUES
(1, 'Ressources humaines', 'RH', '2021-03-30', NULL),
(2, 'Administration', 'A', '2021-03-30', NULL),
(3, 'Gestion', 'G', '2021-03-30', NULL),
(4, 'Informatique', 'I', '2021-03-30', NULL),
(5, 'Juridique', 'J', '2021-03-30', NULL),
(6, 'Projets stratégiques', 'PS', '2021-03-30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `families`
--

CREATE TABLE `families` (
  `id` int(11) NOT NULL,
  `family_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `family_abbreviation` varchar(3) COLLATE utf8_unicode_ci NOT NULL,
  `family_sass` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `family_text` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `families`
--

INSERT INTO `families` (`id`, `family_description`, `family_abbreviation`, `family_sass`, `family_text`, `createdAt`, `updatedAt`) VALUES
(1, 'Légumes', 'l', 'leg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '2022-05-12 10:48:00', '2022-05-12 10:48:00'),
(2, 'Fruits', 'f', 'fruit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '2022-05-12 10:48:00', '2022-05-12 10:48:00'),
(3, 'Produits', 'p', 'prod', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '2022-05-12 10:48:00', '2022-05-12 10:48:00');

-- --------------------------------------------------------

--
-- Table structure for table `fournisseurs`
--

CREATE TABLE `fournisseurs` (
  `id` int(11) NOT NULL,
  `rayon` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `adresse` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `cp` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ville` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pays` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `activite` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fjuridique` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `siret` varchar(14) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nexterne` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tva` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ape` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `banque` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `guichet` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `compte` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `rib` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
  `iban` varchar(27) COLLATE utf8_unicode_ci DEFAULT NULL,
  `domiciliation` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bic` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `autre` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_rc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_cc` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_ccom` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nom_ac` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_rc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_cc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_ccom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `prenom_ac` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tel_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mobile_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_rc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cc` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_ccom` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_ac` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_rc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_cc` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_ccom` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax_ac` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `etat` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `fournisseurs`
--

INSERT INTO `fournisseurs` (`id`, `rayon`, `societe`, `tel`, `mobile`, `fax`, `email`, `site`, `adresse`, `cp`, `ville`, `pays`, `activite`, `fjuridique`, `siret`, `nexterne`, `tva`, `ape`, `banque`, `guichet`, `compte`, `rib`, `iban`, `domiciliation`, `bic`, `autre`, `nom_rc`, `nom_cc`, `nom_ccom`, `nom_ac`, `prenom_rc`, `prenom_cc`, `prenom_ccom`, `prenom_ac`, `tel_rc`, `tel_cc`, `tel_ccom`, `tel_ac`, `mobile_rc`, `mobile_cc`, `mobile_ccom`, `mobile_ac`, `email_rc`, `email_cc`, `email_ccom`, `email_ac`, `fax_rc`, `fax_cc`, `fax_ccom`, `fax_ac`, `etat`, `createdAt`, `updatedAt`) VALUES
(24, '1_1,2_4,', 'Test', '0493426275', '0613505114', '0493426275', 'dpourriere@outlook.fr', 'dpstudio.fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'A completer', '0000-00-00 00:00:00', '2022-08-29 11:33:09'),
(25, '1_1,', 'Essai', '', '06135025', NULL, 'pgerard@mail.pg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Paul', NULL, NULL, NULL, 'Gérard', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-29 11:49:47', '2022-08-29 11:49:47'),
(26, '1_3,1_1,', 'AndCgris', '', '0612546843', NULL, 'andchrus@ghjk.ac', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Astier', NULL, NULL, NULL, 'André', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-29 13:18:22', '2022-08-29 13:25:45'),
(27, '3_7,', 'GD', '', '0612354862', NULL, 'gd@ghj.gd', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Gérard', NULL, NULL, NULL, 'Destoumieux', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-08-29 13:22:16', '2022-08-29 13:30:12'),
(28, '3_7,', 'ONyons', '', '0365245635', NULL, 'onyons@pn.fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Olivier', NULL, NULL, NULL, 'Nyons', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-01 15:17:50', '2022-09-01 15:17:50'),
(29, '3_7,', 'PitchNice', '', '0654859763', NULL, 'contact@pitchnice.fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Brun', NULL, NULL, NULL, 'Marius', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-02 10:22:37', '2022-09-02 10:22:37'),
(32, '3_7,', 'Bet', '0293565854', '', NULL, 'contact@bet.fr', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Bet', NULL, NULL, NULL, 'Patrick', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-05 09:45:14', '2022-09-05 09:45:14'),
(35, '1_1', 'Lambert', '', '06589545', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'Lambert', NULL, NULL, NULL, 'Paul', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2022-09-16 09:36:47', '2022-09-16 09:36:47');

-- --------------------------------------------------------

--
-- Table structure for table `localisations`
--

CREATE TABLE `localisations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `departement` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `situation` int(11) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `localisations`
--

INSERT INTO `localisations` (`id`, `name`, `departement`, `situation`, `createdAt`, `updatedAt`) VALUES
(1, ' Ain', '01', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Aisne', '02', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Allier', '03', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Alpes-de-Haute-Provence', '04', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'Hautes-Alpes', '05', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'Alpes-Maritimes', '06', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'Ardennes', '08', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'Aube', '10', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'Aude', '11', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'Aveyron', '12', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(11, 'Calvados', '14', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(12, 'Cantal', '15', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(13, 'Charente', '16', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(14, 'Charente-Maritime', '17', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(15, 'Cher', '18', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(16, 'Corse-du-Sud', '2A', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(17, 'Haute-Corse', '2B', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(18, 'Creuse', '23', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(19, 'Dordogne', '24', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(20, 'Doubs', '25', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(21, 'Eure', '27', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(22, 'Eure-et-Loir', '28', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(23, 'Gard', '30', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(24, 'Haute-Garonne', '31', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(25, 'Gers', '32', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(26, 'Gironde', '33', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(27, 'Ille-et-Vilaine', '35', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(28, 'Indre', '36', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(29, 'Indre-et-Loire', '37', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(30, 'Jura', '39', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(31, 'Landes', '40', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(32, 'Loir-et-Cher', '41', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(33, 'Loire', '42', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(34, 'Haute-Loire', '43', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(35, 'Loire-Atlantique', '44', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(36, 'Loiret', '45', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(37, 'Lot', '46', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(38, 'Lot-et-Garonne', '47', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(39, 'Maine-et-Loire', '49', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(40, 'Manche', '50', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(41, 'Marne', '51', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(42, 'Haute-Marne', '52', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(43, 'Mayenne', '53', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(44, 'Meurthe-et-Moselle', '54', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(45, 'Meuse', '55', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(46, 'Morbihan', '56', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(47, 'Moselle', '57', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(48, 'Nord', '59', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(49, 'Oise', '60', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(50, 'Orne', '61', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(51, 'Pas-de-Calais', '62', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(52, 'Bas-Rhin', '67', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(53, 'Haut-Rhin', '68', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(54, 'Sarthe', '72', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(55, 'Savoie', '73', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(56, 'Haute-Savoie', '74', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(57, 'Paris', '75', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(58, 'Seine-Maritime', '76', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(59, 'Seine-et-Marne', '77', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(60, 'Yvelines', '78', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(61, 'Somme', '80', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(62, 'Tarn', '81', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(63, 'Tarn-et-Garonne', '82', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(64, 'Var', '83', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(65, 'Vaucluse', '84', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(66, 'Vienne', '86', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(67, 'Haute-Vienne', '87', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(68, 'Vosges', '88', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(69, 'Yonne', '89', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(70, 'Territoire de Belfort', '90', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(71, 'Essonne', '91', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(72, 'Hauts-de-Seine', '92', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(73, 'Seine-Saint-Denis', '93', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(74, 'Val-de-Marne', '94', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(75, 'Val-d\'Oise', '95', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(76, 'Guadeloupe', '971', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(77, 'Martinique', '972', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(78, 'Guyane', '973', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(79, 'Saint-Pierre-et-Miquelon', '975', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(80, 'Mayotte', '976', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(81, 'Saint-Martin', '978', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(82, 'Wallis-et-Futuna', '986', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(83, 'Afghanistan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(84, 'Angola', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(85, 'Autriche', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(86, 'Belgique', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(87, 'Bermudes', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(88, 'Birmanie (Myanmar)', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(89, 'Botswana', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(90, 'Bulgarie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(91, 'Cambodge', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(92, 'Cap-vert', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(93, 'Chypre', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(94, 'Danemark', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(95, 'Fidji', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(96, 'Gabon', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(241, 'Grasse', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(98, 'Guyana', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(99, 'Honduras', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(100, 'Iran', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(101, 'Islande', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(102, 'Kazakhstan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(103, 'Kiribati', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(104, 'Le Vatican', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(105, 'Liban', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(106, 'Liechtenstein', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(107, 'Macao', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(108, 'Malawi', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(109, 'Malte', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(110, 'Maurice', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(111, 'Mexique', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(112, 'Mongolie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(113, 'Mozambique', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(114, 'Ouganda', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(115, 'Palaos', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(116, 'Paraguay', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(117, 'Philippines', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(118, 'Porto Rico', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(119, 'Russie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(120, 'Saint-Kitts-et-Nevis', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(121, 'Saint-Vincent-et-les Grenadines', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(122, 'Salvador', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(123, 'Seychelles', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(124, 'Slovaquie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(125, 'Soudan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(126, 'Suisse', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(127, 'Swaziland', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(128, 'Togo', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(129, 'Tunisie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(130, 'Tuvalu', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(131, 'Vanuatu', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(243, 'Bourgogne-Franche-Comté', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(133, 'Zimbabwe', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(134, 'Afrique du Sud', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(135, 'Allemagne', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(136, 'Anguilla', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(137, 'Arabie saoudite', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(138, 'Aruba', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(139, 'Bangladesh', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(140, 'Belize', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(141, 'Bhoutan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(142, 'Bolivie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(143, 'Burkina Faso', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(144, 'Cameroun', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(145, 'Chili', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(146, 'Colombie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(147, 'Croatie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(148, 'Djibouti', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(149, 'Espagne', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(150, 'Finlande', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(151, 'Gambie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(152, 'Ghana', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(153, 'Grenade', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(154, 'Guam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(155, 'Hong-Kong', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(156, 'Inde', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(157, 'Iraq', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(158, 'Japon', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(159, 'Kenya', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(160, 'Lesotho', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(161, 'Lituanie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(162, 'Madagascar', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(163, 'Maldives', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(164, 'Maroc', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(165, 'Mauritanie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(166, 'Moldavie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(167, 'Namibie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(168, 'Nicaragua', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(169, 'Panama', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(170, 'Pays-Bas', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(171, 'Pologne', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(172, 'Portugal', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(173, 'Roumanie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(174, 'Rwanda', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(175, 'Saint-Marin', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(176, 'Samoa', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(177, 'Sierra Leone', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(178, 'Sri Lanka', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(179, 'Suriname', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(180, 'Syrie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(181, 'Tanzanie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(182, 'Tonga', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(183, 'Ukraine', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(184, 'Venezuela', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(185, 'Albanie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(186, 'Andorre', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(187, 'Antigua-et-Barbuda', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(188, 'Argentine', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(189, 'Australie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(190, 'Bahamas', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(191, 'Barbade', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(192, 'Brunei', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(193, 'Burundi', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(194, 'Canada', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(195, 'Chine', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(196, 'Comores', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(197, 'Costa Rica', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(198, 'Cuba', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(199, 'Dominique', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(200, 'Estonie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(201, 'France', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(202, 'Gibraltar', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(203, 'Groenland', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(204, 'Guatemala', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(205, 'Hongrie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(206, 'Irlande', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(207, 'Italie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(208, 'Jordanie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(209, 'Kirghizistan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(210, 'Laos', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(211, 'Lettonie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(212, 'Libye', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(213, 'Luxembourg', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(214, 'Malaisie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(215, 'Mali', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(218, 'Monaco', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(219, 'Montserrat', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(220, 'Nauru', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(221, 'Niger', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(222, 'Oman', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(223, 'Pakistan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(224, 'Qatar', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(225, 'Royaume-Uni', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(226, 'Sahara occidental', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(242, 'Auvergne-Rhône-Alpes', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(228, 'Sainte-Lucie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(229, 'Serbie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(230, 'Singapour', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(231, 'Somalie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(232, 'Svalbard et Jan Mayen', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(233, 'Tadjikistan', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(234, 'Tchad', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(235, 'Timor oriental', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(236, 'Turquie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(237, 'Uruguay', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(238, 'Viet-Nam', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(239, 'Zambie', NULL, 5, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(240, 'PACA', NULL, 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(244, 'Bretagne', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(245, 'Centre-Val-de-Loire', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(281, 'Corrèze', '19', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(247, 'Grand Est', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(248, 'Hauts-de-France', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(249, 'Ile-de-France', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(250, 'Normandie', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(251, 'Nouvelle-Aquitaine', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(252, 'Occitanie', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(253, 'Pays de la Loire', NULL, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(273, 'Suède', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(325, 'Nice', NULL, 1, '2022-09-02 10:22:37', '2022-09-02 10:22:37'),
(271, 'Slovénie', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(326, 'Puget', NULL, 1, '2022-09-02 15:30:12', '2022-09-02 15:30:12'),
(269, 'République tchèque', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(267, 'Grèce', NULL, 4, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(266, 'Bouches-du-Rhône', '13', 2, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(274, 'Peymeinade', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(276, 'Mouans-Sartoux', NULL, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(278, 'Drôme', '26', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(279, 'Ardèche', '07', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(280, 'Ariège', '09', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(282, 'Côte-d\'Or', '21', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(283, 'Côtes-d\'Armor', '22', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(284, 'Finistère', '29', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(286, 'Hérault', '34', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(288, 'Isère', '38', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(290, 'Lozère', '48', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(292, 'Nièvre', '58', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(294, 'Puy-de-Dôme', '63', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(296, 'Pyrénées-Atlantiques', '64', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(297, 'Hautes-Pyrénées', '65', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(298, 'Pyrénées-Orientales', '66', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(302, 'Rhône', '69', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(338, 'Escragnoles', NULL, 1, '2022-09-15 13:30:57', '2022-09-15 13:30:57'),
(304, 'Haute-Saône', '70', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(305, 'Saône-et-Loire', '71', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(308, 'Deux-Sèvres', '79', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(310, 'Vendée', '85', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(324, 'Caussoles', NULL, 1, '2022-08-29 15:50:00', '2022-08-29 15:50:00'),
(312, 'La Réunion', '974', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(314, 'Saint-Barthélemy', '977', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(316, 'Polynésie française', '987', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(317, 'Terres australes et antarctiques françaises', '984', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(318, 'Nouvelle-Calédonie', '988', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(319, 'Ile de Clipperton', '989', 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(327, 'Menton', NULL, 1, '2022-09-02 15:40:12', '2022-09-02 15:40:12');

-- --------------------------------------------------------

--
-- Table structure for table `marges`
--

CREATE TABLE `marges` (
  `id` int(11) NOT NULL,
  `taux` decimal(5,2) NOT NULL,
  `designation` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `marges`
--

INSERT INTO `marges` (`id`, `taux`, `designation`) VALUES
(1, '21.00', 'Commerce de détail en magasin non spécialisé'),
(2, '37.20', 'Commerce de détail alimentaire en magasin spécialisé'),
(3, '39.00', 'Commerce de détail sur éventaires et marchés'),
(4, '41.90', 'Commerce de détail hors magasin, éventaires ou marchés');

-- --------------------------------------------------------

--
-- Table structure for table `mesures`
--

CREATE TABLE `mesures` (
  `id` int(11) NOT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `rayon` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mesures`
--

INSERT INTO `mesures` (`id`, `unit`, `rayon`, `type`, `createdAt`, `updatedAt`) VALUES
(1, 'kg', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(2, 'g', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(3, 'ml', '3_7, 3_8, 3_9', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(4, 'l', '3_7, 3_8, 3_9', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(5, 'pièce', '1_1, 1_2, 1_3, 2_4, 2_5, 2_63_7,', 'mesure', '2022-08-22 11:25:22', '2022-09-01 13:24:01'),
(8, 'bouquet', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(11, 'cl', '3_7, 3_8, 3_9', 'mesure', '2022-08-22 11:25:22', '2022-08-22 11:25:22'),
(15, 'barquette', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6', 'conditionnement', '2022-08-22 12:06:38', '2022-08-22 12:06:38'),
(16, 'bouteille', '3_7, 3_8, 3_9', 'conditionnement', '2022-08-22 12:06:38', '2022-08-22 12:06:38'),
(17, 'sachet', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'conditionnement', '2022-08-22 12:08:42', '2022-08-22 12:08:42'),
(18, 'bocal', '3_7, 3_8', 'conditionnement', '2022-08-22 12:10:42', '2022-08-22 12:10:42'),
(19, 'palette', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'conditionnement', '2022-08-22 12:15:23', '2022-08-22 12:15:23'),
(20, 'cagette', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8', 'conditionnement', '2022-08-22 12:15:23', '2022-08-22 12:15:23'),
(22, 'carton', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'conditionnement', '2022-08-22 12:15:23', '2022-08-22 12:15:23'),
(23, 'sac', '1_1, 1_2, 1_3, 2_4, 2_5, 2_6, 3_7, 3_8, 3_9', 'conditionnement', '2022-08-22 12:15:23', '2022-08-22 12:15:23'),
(25, 'vrac', '1_1,2_4,', 'conditionnement', '2022-08-30 09:44:19', '2022-09-01 12:37:17'),
(24, 'grappe', '1_1,', 'mesure', '2022-08-29 16:30:19', '2022-08-29 16:30:19');

-- --------------------------------------------------------

--
-- Table structure for table `rayons`
--

CREATE TABLE `rayons` (
  `id` int(11) NOT NULL,
  `cat` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `category_description` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cat_description` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `products` varchar(5) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'true',
  `family_abbreviation` int(11) NOT NULL,
  `category_abbreviation` int(11) NOT NULL,
  `family_sass` varchar(5) COLLATE utf8_unicode_ci NOT NULL,
  `category_text` text COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `rayons`
--

INSERT INTO `rayons` (`id`, `cat`, `category_description`, `cat_description`, `products`, `family_abbreviation`, `category_abbreviation`, `family_sass`, `category_text`, `createdAt`, `updatedAt`) VALUES
(1, 'lfrais', 'frais', 'Légumes frais', 'true', 1, 1, 'leg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'lsecs', 'secs', 'Légumes secs', 'true', 1, 2, 'leg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'ltts', 'toutes saisons', 'Légumes toutes saisons', 'true', 1, 3, 'leg', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'ffrais', 'frais', 'Fruits frais', 'true', 2, 1, 'fruit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(5, 'fsecs', 'secs', 'Fruits secs', 'true', 2, 2, 'fruit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(6, 'fexotiques', 'exotiques', 'Fruits exotiques', 'true', 2, 3, 'fruit', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(7, 'pprepa', 'préparés', 'Produits préparés', 'true', 3, 1, 'prod', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(8, 'pmanu', 'manufacturés', 'Produits manufacturés', 'true', 3, 2, 'prod', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(9, 'pcong', 'congelés', 'Produits congelés', 'true', 3, 3, 'prod', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(10, 'tools', 'outils', 'Outils', 'true', 0, 0, 'tools', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita explicabo reiciendis, saepe quas fuga quam. Quaerat dicta iure quod vitae est atque porro, natus mollitia, eaque rem quas cumque repudiandae!', '2022-08-08 12:01:34', '2022-08-08 12:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `stockscopy`
--

CREATE TABLE `stockscopy` (
  `id` int(11) NOT NULL,
  `week` varchar(8) NOT NULL,
  `departement` varchar(5) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_prod` varchar(255) NOT NULL,
  `name` varchar(150) NOT NULL,
  `variety` varchar(150) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(15) DEFAULT NULL,
  `agr` varchar(20) NOT NULL,
  `loc` varchar(150) NOT NULL,
  `four` varchar(200) NOT NULL,
  `mes` varchar(100) NOT NULL,
  `cond` varchar(100) DEFAULT NULL,
  `pf` varchar(10) NOT NULL,
  `marge` varchar(9) NOT NULL DEFAULT '15',
  `quantity` varchar(10) NOT NULL,
  `arrival` date NOT NULL,
  `commande` date DEFAULT NULL,
  `stock_arrival` varchar(10) NOT NULL,
  `stock_current` varchar(10) NOT NULL,
  `clone` varchar(8) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `stockscopy`
--

INSERT INTO `stockscopy` (`id`, `week`, `departement`, `user_id`, `id_prod`, `name`, `variety`, `description`, `image`, `agr`, `loc`, `four`, `mes`, `cond`, `pf`, `marge`, `quantity`, `arrival`, `commande`, `stock_arrival`, `stock_current`, `clone`, `createdAt`, `updatedAt`) VALUES
(347, '2022-W42', '3_7', 0, '3_7_108_1_1_278_28__18', 'Olives noires', 'de Nyons', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!\r\n', NULL, 'Bio', 'Drôme', 'ONyons', '', 'bocal', '7.00', '15', '1.00', '2022-09-02', NULL, '50.00', '50.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(348, '2022-W42', '1_1', 0, '1_1_5__1_276_24_5_', 'Brocolis', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Mouans-Sartoux', 'Test', 'pièce', '', '0.50', '15', '1.00', '2022-08-26', NULL, '60.00', '60.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(349, '2022-W42', '1_1', 0, '1_1_3_11_3_4_24_1_', 'Aubergines', 'tigrées', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Traditionnelle', 'Alpes-de-Haute-Provence', 'Test', 'kg', '', '5.00', '15', '1.00', '2022-08-26', NULL, '5.00', '5.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(350, '2022-W42', '1_1', 0, '1_1_1_3_1_274_24_8_', 'Artichauts', 'poivrades', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Peymeinade', 'Test', 'bouquet', '', '2.00', '15', '1.00', '2022-08-26', NULL, '30.00', '30.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(351, '2022-W42', '2_4', 0, '2_4_55__1_324_24_1_25', 'Cassis', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Caussoles', 'Test', 'kg', 'vrac', '2.00', '15', '1.00', '2022-09-01', NULL, '5.00', '5.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(352, '2022-W42', '1_2', 0, '1_2_41__1_241_24_8_', 'Pois chiches', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'bouquet', '', '1.00', '15', '1.00', '2022-08-26', NULL, '15.00', '15.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(353, '2022-W42', '1_2', 0, '1_2_40_5_1_241_24_8_', 'Lentilles', 'du Puy', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'sachet', '', '0.50', '15', '1.00', '2022-08-26', NULL, '150.00', '150.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(354, '2022-W42', '1_3', 0, '1_3_42__1_241_24_8_', 'Ail', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'pièce', '', '0.10', '15', '1.00', '2022-08-26', NULL, '15.00', '15.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(355, '2022-W42', '1_3', 0, '1_3_48__1_241_24_8_', 'Navets', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'vrac', '', '0.20', '15', '1.00', '2022-08-26', NULL, '15.00', '15.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(356, '2022-W42', '2_4', 0, '2_4_61__2_241_24_8_', 'Figues', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Raisonnée', 'Grasse', 'Test', 'vrac', '', '0.80', '15', '1.00', '2022-08-26', NULL, '5.00', '5.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(357, '2022-W42', '2_5', 0, '2_5_87__3_241_24_8_', 'Pignons de pin', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Traditionnelle', 'Grasse', 'Test', 'g', 'sachet', '1.80', '15', '100.00', '2022-08-26', NULL, '5.00', '5.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(358, '2022-W42', '2_5', 0, '2_5_86__1_241_24_8_', 'Noix', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'g', 'sachet', '1.00', '15', '100.00', '2022-08-26', NULL, '5.00', '5.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(359, '2022-W42', '2_6', 0, '2_6_88_18_1_241_24_8_', 'Ananas', 'Victoria', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'pièce', '', '3.00', '15', '1.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(360, '2022-W42', '2_6', 0, '2_6_100__1_241_24_8_', 'Mangues', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Bio', 'Grasse', 'Test', 'pièce', '', '2.00', '15', '1.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(361, '2022-W42', '2_6', 0, '2_6_101__3_241_24_8_', 'Noix de coco', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Traditionnelle', 'Grasse', 'Test', 'pièce', '', '1.30', '15', '1.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(362, '2022-W42', '3_7', 0, '3_7_106__2_241_24_8_', 'Betteraves', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Raisonnée', 'Grasse', 'Test', 'pièce', '', '0.50', '15', '1.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(363, '2022-W42', '3_7', 0, '3_7_108_2_1_241_24_8', 'Olives noires', 'picholines', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Raisonnée', 'Grasse', 'Test', 'g', 'bocal', '2.50', '15', '150.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(364, '2022-W42', '3_8', 0, '3_8_109__2_241_24_8_', 'Haricots blancs', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Raisonnée', 'Grasse', 'Test', 'g', 'bocal', '1.50', '15', '150.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00'),
(365, '2022-W42', '3_9', 0, '3_9_805__2_241_24_8_', 'Sorbet ananas', '', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Harum molestiae blanditiis modi. Repellendus reiciendis hic veritatis minima sed incidunt dolore alias perspiciatis, voluptatem repellat veniam reprehenderit nihil aliquid aut iste!', NULL, 'Raisonnée', 'Grasse', 'Test', 'l', 'barquette', '2.50', '15', '1.00', '2022-08-26', NULL, '25.00', '25.00', NULL, '2022-10-17 14:33:00', '2022-10-17 14:33:00');

-- --------------------------------------------------------

--
-- Table structure for table `taxes`
--

CREATE TABLE `taxes` (
  `id` int(11) NOT NULL,
  `taux` decimal(5,2) NOT NULL,
  `designation` varchar(150) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `taxes`
--

INSERT INTO `taxes` (`id`, `taux`, `designation`) VALUES
(1, '5.50', 'Réduit'),
(2, '20.00', 'Normal'),
(3, '10.00', 'Réduit intermédiaire'),
(4, '2.10', 'Spécifique'),
(5, '0.00', 'Auto-entrepreneur');

-- --------------------------------------------------------

--
-- Table structure for table `varietes`
--

CREATE TABLE `varietes` (
  `id` int(11) NOT NULL,
  `id_article` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `variete` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL DEFAULT current_timestamp(),
  `updatedAt` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `varietes`
--

INSERT INTO `varietes` (`id`, `id_article`, `variete`, `createdAt`, `updatedAt`) VALUES
(1, ',108,', 'de Nyons', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(2, ',108,', 'picholines', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(3, ',1,', 'poivrades', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(4, ',1,', 'bretons', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(5, ',40,', 'du Puy', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(6, ',40,', 'corails', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(7, ',2,4,', 'sauvages', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(8, ',2,40,', 'vertes', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(9, ',2,3,17,', 'blanches', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(10, ',3,', 'violettes', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(11, ',3,', 'tigrées', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(12, ',9,', 'blancs', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(13, ',9,', 'bruns', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(14, ',16,', 'spaghettis', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(15, ',16,', 'butternut', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(16, ',17,', 'jaunes', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(17, ',17,', 'rondes', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(18, ',88,', 'Victoria', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(19, ',91,', 'plantains', '2022-08-08 16:20:02', '2022-08-08 16:20:02'),
(20, ',91,', 'freycinettes', '2022-08-08 16:20:02', '2022-08-08 16:20:02');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cultures`
--
ALTER TABLE `cultures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `departements`
--
ALTER TABLE `departements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `families`
--
ALTER TABLE `families`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `localisations`
--
ALTER TABLE `localisations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `marges`
--
ALTER TABLE `marges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mesures`
--
ALTER TABLE `mesures`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rayons`
--
ALTER TABLE `rayons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stockscopy`
--
ALTER TABLE `stockscopy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `taxes`
--
ALTER TABLE `taxes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `varietes`
--
ALTER TABLE `varietes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cultures`
--
ALTER TABLE `cultures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `departements`
--
ALTER TABLE `departements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `families`
--
ALTER TABLE `families`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `fournisseurs`
--
ALTER TABLE `fournisseurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `localisations`
--
ALTER TABLE `localisations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=339;

--
-- AUTO_INCREMENT for table `marges`
--
ALTER TABLE `marges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `mesures`
--
ALTER TABLE `mesures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `rayons`
--
ALTER TABLE `rayons`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `stockscopy`
--
ALTER TABLE `stockscopy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=366;

--
-- AUTO_INCREMENT for table `taxes`
--
ALTER TABLE `taxes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `varietes`
--
ALTER TABLE `varietes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
