-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 25 mars 2024 à 21:55
-- Version du serveur : 8.2.0
-- Version de PHP : 8.2.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `mediatheque`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `auth_permission`
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
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add emprunteur', 7, 'add_emprunteur'),
(26, 'Can change emprunteur', 7, 'change_emprunteur'),
(27, 'Can delete emprunteur', 7, 'delete_emprunteur'),
(28, 'Can view emprunteur', 7, 'view_emprunteur'),
(29, 'Can add jeu de plateau', 8, 'add_jeudeplateau'),
(30, 'Can change jeu de plateau', 8, 'change_jeudeplateau'),
(31, 'Can delete jeu de plateau', 8, 'delete_jeudeplateau'),
(32, 'Can view jeu de plateau', 8, 'view_jeudeplateau'),
(33, 'Can add dvd', 9, 'add_dvd'),
(34, 'Can change dvd', 9, 'change_dvd'),
(35, 'Can delete dvd', 9, 'delete_dvd'),
(36, 'Can view dvd', 9, 'view_dvd'),
(37, 'Can add cd', 10, 'add_cd'),
(38, 'Can change cd', 10, 'change_cd'),
(39, 'Can delete cd', 10, 'delete_cd'),
(40, 'Can view cd', 10, 'view_cd'),
(41, 'Can add livre', 11, 'add_livre'),
(42, 'Can change livre', 11, 'change_livre'),
(43, 'Can delete livre', 11, 'delete_livre'),
(44, 'Can view livre', 11, 'view_livre'),
(45, 'Can add emprunteur_ livre', 12, 'add_emprunteur_livre'),
(46, 'Can change emprunteur_ livre', 12, 'change_emprunteur_livre'),
(47, 'Can delete emprunteur_ livre', 12, 'delete_emprunteur_livre'),
(48, 'Can view emprunteur_ livre', 12, 'view_emprunteur_livre'),
(49, 'Can add emprunteur_ dvd', 13, 'add_emprunteur_dvd'),
(50, 'Can change emprunteur_ dvd', 13, 'change_emprunteur_dvd'),
(51, 'Can delete emprunteur_ dvd', 13, 'delete_emprunteur_dvd'),
(52, 'Can view emprunteur_ dvd', 13, 'view_emprunteur_dvd'),
(53, 'Can add emprunteur_ cd', 14, 'add_emprunteur_cd'),
(54, 'Can change emprunteur_ cd', 14, 'change_emprunteur_cd'),
(55, 'Can delete emprunteur_ cd', 14, 'delete_emprunteur_cd'),
(56, 'Can view emprunteur_ cd', 14, 'view_emprunteur_cd'),
(57, 'Can add emprunteur_ jeu', 15, 'add_emprunteur_jeu'),
(58, 'Can change emprunteur_ jeu', 15, 'change_emprunteur_jeu'),
(59, 'Can delete emprunteur_ jeu', 15, 'delete_emprunteur_jeu'),
(60, 'Can view emprunteur_ jeu', 15, 'view_emprunteur_jeu');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'mediatheque', 'emprunteur'),
(8, 'mediatheque', 'jeudeplateau'),
(9, 'mediatheque', 'dvd'),
(10, 'mediatheque', 'cd'),
(11, 'mediatheque', 'livre'),
(12, 'mediatheque', 'emprunteur_livre'),
(13, 'mediatheque', 'emprunteur_dvd'),
(14, 'mediatheque', 'emprunteur_cd'),
(15, 'mediatheque', 'emprunteur_jeu');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-10 21:17:02.272435'),
(2, 'auth', '0001_initial', '2024-03-10 21:17:02.547697'),
(3, 'admin', '0001_initial', '2024-03-10 21:17:02.633463'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-10 21:17:02.638449'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-10 21:17:02.643446'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-10 21:17:02.694276'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-10 21:17:02.728185'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-10 21:17:02.751125'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-10 21:17:02.756134'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-10 21:17:02.777088'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-10 21:17:02.778085'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-10 21:17:02.783040'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-10 21:17:02.807971'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-10 21:17:02.828943'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-10 21:17:02.847865'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-10 21:17:02.854847'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-10 21:17:02.873797'),
(18, 'mediatheque', '0001_initial', '2024-03-10 21:17:02.987492'),
(19, 'mediatheque', '0002_alter_emprunteur_bloque', '2024-03-10 21:17:03.005471'),
(20, 'mediatheque', '0003_alter_emprunteur_id_emprunteur', '2024-03-10 21:17:03.129114'),
(21, 'mediatheque', '0004_remove_cd_id_emprunteur_remove_dvd_id_emprunteur_and_more', '2024-03-10 21:17:03.261758'),
(22, 'mediatheque', '0005_alter_livre_dateemprunt_alter_livre_disponible', '2024-03-10 21:17:03.302649'),
(23, 'sessions', '0001_initial', '2024-03-10 21:17:03.330585'),
(24, 'mediatheque', '0006_remove_livre_dateemprunt_remove_livre_disponible_and_more', '2024-03-11 18:25:56.472689'),
(25, 'mediatheque', '0007_emprunteur_livre_livre_and_more', '2024-03-11 19:48:59.017863'),
(26, 'mediatheque', '0008_remove_dvd_dateemprunt_remove_dvd_disponible_and_more', '2024-03-12 18:58:10.203605'),
(27, 'mediatheque', '0009_alter_emprunteur_dvd_dateemprunt_and_more', '2024-03-12 20:13:34.274545'),
(28, 'mediatheque', '0010_remove_cd_dateemprunt_remove_cd_disponible_and_more', '2024-03-13 19:32:10.384838'),
(29, 'mediatheque', '0011_alter_emprunteur_cd_disponible', '2024-03-13 19:37:52.834208'),
(30, 'mediatheque', '0012_alter_livre_auteur_alter_livre_name', '2024-03-14 18:55:47.337183'),
(31, 'mediatheque', '0013_alter_livre_auteur_alter_livre_name', '2024-03-14 18:58:06.555460'),
(32, 'mediatheque', '0014_emprunteur_jeu', '2024-03-15 18:10:05.452039'),
(33, 'mediatheque', '0015_emprunteur_jeu_disponible', '2024-03-25 21:28:11.253183');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('bs43i0z70anfvo7dyy6aua1yw63g2wwo', 'eyJsaXZyZXNfc2VsZWN0aW9ubmVzIjpbNl19:1rjm9L:ZceD_ZIcM488Hy9J0uEshaiAONUad-GDHa6Xne_UaOw', '2024-03-25 20:21:31.038380');

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_cd`
--

DROP TABLE IF EXISTS `mediatheque_cd`;
CREATE TABLE IF NOT EXISTS `mediatheque_cd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `artiste` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_cd`
--

INSERT INTO `mediatheque_cd` (`id`, `name`, `artiste`) VALUES
(1, 'Legend', 'Bob Marley'),
(2, 'Third World Child', 'Johnny Clegg'),
(3, 'Adele 21', 'Adele');

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_dvd`
--

DROP TABLE IF EXISTS `mediatheque_dvd`;
CREATE TABLE IF NOT EXISTS `mediatheque_dvd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `realisateur` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_dvd`
--

INSERT INTO `mediatheque_dvd` (`id`, `name`, `realisateur`) VALUES
(1, 'Avatar : La voie de l\'eau', 'James Cameron'),
(2, 'Oppenheimer', 'Christopher Nolan'),
(3, 'Astérix et Obélix : Mission Cléopâtre', 'Alain Chabat');

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_emprunteur`
--

DROP TABLE IF EXISTS `mediatheque_emprunteur`;
CREATE TABLE IF NOT EXISTS `mediatheque_emprunteur` (
  `id_emprunteur` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `bloque` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_emprunteur`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_emprunteur`
--

INSERT INTO `mediatheque_emprunteur` (`id_emprunteur`, `name`, `bloque`) VALUES
(1, 'Martin', NULL),
(2, 'André', NULL),
(5, 'Joseph', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_emprunteur_cd`
--

DROP TABLE IF EXISTS `mediatheque_emprunteur_cd`;
CREATE TABLE IF NOT EXISTS `mediatheque_emprunteur_cd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dateEmprunt` date NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `cd_id` bigint NOT NULL,
  `emprunteurs_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mediatheque_emprunteur_cd_cd_id_d38959c8` (`cd_id`),
  KEY `mediatheque_emprunteur_cd_emprunteurs_id_67bb738a` (`emprunteurs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=177 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_emprunteur_cd`
--

INSERT INTO `mediatheque_emprunteur_cd` (`id`, `dateEmprunt`, `disponible`, `cd_id`, `emprunteurs_id`) VALUES
(176, '2024-03-25', 1, 2, 2),
(175, '2024-03-25', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_emprunteur_dvd`
--

DROP TABLE IF EXISTS `mediatheque_emprunteur_dvd`;
CREATE TABLE IF NOT EXISTS `mediatheque_emprunteur_dvd` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dateEmprunt` date NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `dvd_id` bigint NOT NULL,
  `emprunteurs_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mediatheque_emprunteur_dvd_dvd_id_f71c457d` (`dvd_id`),
  KEY `mediatheque_emprunteur_dvd_emprunteurs_id_0a368473` (`emprunteurs_id`)
) ENGINE=MyISAM AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_emprunteur_dvd`
--

INSERT INTO `mediatheque_emprunteur_dvd` (`id`, `dateEmprunt`, `disponible`, `dvd_id`, `emprunteurs_id`) VALUES
(203, '2024-03-25', 1, 2, 2),
(202, '2024-03-25', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_emprunteur_jeu`
--

DROP TABLE IF EXISTS `mediatheque_emprunteur_jeu`;
CREATE TABLE IF NOT EXISTS `mediatheque_emprunteur_jeu` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `emprunteurs_id` int NOT NULL,
  `jeu_id` bigint NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `mediatheque_emprunteur_jeu_emprunteurs_id_2927b728` (`emprunteurs_id`),
  KEY `mediatheque_emprunteur_jeu_jeu_id_a3367682` (`jeu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_emprunteur_jeu`
--

INSERT INTO `mediatheque_emprunteur_jeu` (`id`, `emprunteurs_id`, `jeu_id`, `disponible`) VALUES
(113, 2, 2, 1),
(111, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_emprunteur_livre`
--

DROP TABLE IF EXISTS `mediatheque_emprunteur_livre`;
CREATE TABLE IF NOT EXISTS `mediatheque_emprunteur_livre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dateEmprunt` date NOT NULL,
  `disponible` tinyint(1) DEFAULT NULL,
  `emprunteurs_id` int NOT NULL,
  `livre_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mediatheque_emprunteur_livre_emprunteurs_id_ce01addf` (`emprunteurs_id`),
  KEY `mediatheque_emprunteur_livre_livre_id_ec556d2c` (`livre_id`)
) ENGINE=MyISAM AUTO_INCREMENT=288 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_emprunteur_livre`
--

INSERT INTO `mediatheque_emprunteur_livre` (`id`, `dateEmprunt`, `disponible`, `emprunteurs_id`, `livre_id`) VALUES
(287, '2024-03-25', 1, 2, 2),
(286, '2024-03-25', 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_jeudeplateau`
--

DROP TABLE IF EXISTS `mediatheque_jeudeplateau`;
CREATE TABLE IF NOT EXISTS `mediatheque_jeudeplateau` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `createur` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_jeudeplateau`
--

INSERT INTO `mediatheque_jeudeplateau` (`id`, `name`, `createur`) VALUES
(1, 'Pandemic', 'Matt Leacock'),
(2, 'Mr. Jack London', 'Bruno Cathala, Ludovic Maublanc'),
(3, 'Les aventuriers du rail Europe', 'Alan R. Moon'),
(4, 'Escape Room Le Jeu - Le Voyage Dans Le Temps', 'Riviera Games'),
(5, 'Péril En Haute Mer - Cluedo Escape Game', 'Hasbro');

-- --------------------------------------------------------

--
-- Structure de la table `mediatheque_livre`
--

DROP TABLE IF EXISTS `mediatheque_livre`;
CREATE TABLE IF NOT EXISTS `mediatheque_livre` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auteur` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `mediatheque_livre`
--

INSERT INTO `mediatheque_livre` (`id`, `name`, `auteur`) VALUES
(1, 'Harry Potter, tome 1 : Harry Potter à l\'école des sorciers', 'J. K. Rowling'),
(2, 'Harry Potter, tome 2 : Harry Potter et la chambre des secrets', 'J. K. Rowling'),
(3, 'Harry Potter, tome 3 : Harry Potter et le prisonnier d\'Azkaban', 'J. K. Rowling'),
(4, 'Harry Potter, tome 4 : Harry Potter et la coupe de feu', 'J. K. Rowling'),
(5, 'Holly', 'Stephen King'),
(6, 'La Conjuration de Dante', 'Fabrice Papillon'),
(7, 'La Jeune fille et la nuit', 'Guillaume Musso'),
(9, 'Le seigneur des anneaux Tome 1 : la fraternité de l\'anneau', 'J. R. R. Tolkien'),
(10, 'Voyage au centre de la terre', 'Jules Verne'),
(11, 'Le livre des Baltimore', 'Joel Dicker');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
