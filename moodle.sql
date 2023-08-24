-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 24 août 2023 à 04:40
-- Version du serveur : 10.4.25-MariaDB
-- Version de PHP : 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `moodle`
--

-- --------------------------------------------------------

--
-- Structure de la table `administrateur_cour`
--

CREATE TABLE `administrateur_cour` (
  `id` bigint(20) NOT NULL,
  `intitule` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `enseignant_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `administrateur_cour`
--

INSERT INTO `administrateur_cour` (`id`, `intitule`, `code`, `enseignant_id`) VALUES
(2, 'Examen', 'jk', 12);

-- --------------------------------------------------------

--
-- Structure de la table `appecole_devoir`
--

CREATE TABLE `appecole_devoir` (
  `id` bigint(20) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  `matiere` varchar(255) NOT NULL,
  `statut` varchar(20) NOT NULL,
  `projet` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appecole_devoir`
--

INSERT INTO `appecole_devoir` (`id`, `intitule`, `matiere`, `statut`, `projet`) VALUES
(3, 'Devoir', 'Histoire', 'soumis', 'projets/api.txt'),
(5, 'Examen', 'Histoire', 'archivé', 'projets/rose_oPjV7Xt.xlsx'),
(6, 'Examen', 'Histoire', 'corrigé', 'projets/wordpress.txt'),
(7, 'Examen', 'Anglais', 'en_cours', 'projets/9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appecole_user`
--

CREATE TABLE `appecole_user` (
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
  `role` varchar(30) NOT NULL,
  `birthdate` date DEFAULT NULL,
  `identifiant` varchar(20) DEFAULT NULL,
  `profil` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `appecole_user`
--

INSERT INTO `appecole_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`, `role`, `birthdate`, `identifiant`, `profil`) VALUES
(1, 'pbkdf2_sha256$390000$iUlE0cOSgw09U2W8aK5Z6x$upZfpbMSMlbBebJmbwH24W9iJyQ7j249IScJWUpNZng=', '2023-08-20 12:30:55.787012', 1, 'Dimitri', '', '', 'dimitrihodia0@gmail.com', 1, 1, '2023-08-14 23:48:36.523526', '', NULL, NULL, '12.png'),
(8, 'pbkdf2_sha256$390000$8y96QpZnd9eLD1u3zXVrxW$N4QBGGl5ausKnXS0FMo4LEEG3r14qTcJx34v5AZYT38=', '2023-08-21 06:18:55.600830', 0, 'H6', 'HODIA', 'Essotom', 'dimitrihodiaH@gmail.com', 0, 1, '2023-08-15 20:56:28.178571', 'Etudiant', '2023-08-24', '005', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg'),
(9, 'pbkdf2_sha256$390000$Cc4G5M1Iwp2A8LHn9JSbJe$2kxAFrXssqjUQVHn8Tt7Vj0WgvDK8gT6mngKH5AgIgw=', '2023-08-18 00:53:41.594568', 0, 'matilda', 'Essotom', 'HODIA', 'dimitrihodia4@gmail.com', 0, 1, '2023-08-18 00:47:35.444193', 'Enseignant', '2023-08-10', '005', '12.png'),
(10, 'pbkdf2_sha256$390000$s5Uf6eKg59oaYjQ2lxGvX5$MdUBHUwvav5htJXNa9LgDr7IX2VNp6kvdPilsJlOrcc=', NULL, 0, 'belinda', 'Essotom', 'HODIA', 'dimitrihodiaBe@gmail.com', 0, 1, '2023-08-18 10:53:24.918251', 'Enseignant', '2023-08-11', '002', '12.png'),
(11, 'pbkdf2_sha256$390000$f9kSRFIFFge1BZiRW1qNia$paACUMxloDPGxyrO9kKlU+YC4A6Sze0jRrPdM0KJMoY=', '2023-08-23 21:53:46.444901', 0, 'Gazelle', 'Essotom', 'HODIA', 'dimitrihodiaG@gmail.com', 0, 1, '2023-08-18 11:07:12.177203', 'Administrateur', '2023-08-11', '005', '12.png'),
(12, 'pbkdf2_sha256$390000$RKNUTbqL2mgcH8PIdwxNe6$FoDe12dH2MoO7YhLkZ3dAK6r842EC4FrnBCN8iqXEcA=', '2023-08-21 07:01:51.065759', 0, 'Badgirl', 'HODIA', 'Essotom', 'dimitrihodiaBa@gmail.com', 0, 1, '2023-08-18 11:13:50.408163', 'Enseignant', '2023-08-03', '005', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg'),
(13, 'pbkdf2_sha256$390000$M2jj9UNcc21rFLRJNY0Z1I$iukSQYfu5lRp06jnRn0geRZfZYS3rwKcV0kUp6ISHbs=', NULL, 0, 'OGmeuf', 'Essotom', 'HODIA', 'dimitrihodiaO@gmail.com', 0, 1, '2023-08-19 01:18:58.161863', 'Enseignant', '2023-08-02', '005', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg'),
(14, 'pbkdf2_sha256$390000$Q9Zbv0ppnYwRPYpRNKQRGw$xS6Mv4+rHNHYP+ajw2amesDDZNzqb2RwpsmaiWSu57o=', '2023-08-21 23:37:34.832535', 0, 'Abalakoma', 'HODIA', 'Essotom', 'dimitrihodiaAb@gmail.com', 0, 1, '2023-08-20 11:35:01.922322', 'Etudiant', '2023-08-24', '005', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg'),
(15, 'pbkdf2_sha256$390000$1smpOFd4IsfyV8SkE7mT2m$UrOUivh2jMoRH6KnJdsqmkSkfhyIH9ltEkmL514qK4k=', NULL, 0, 'o', 'Essotom', 'HODIA', 'dimitrihodia00@gmail.com', 0, 1, '2023-08-20 12:38:26.965338', 'Etudiant', '2023-08-10', '005', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg'),
(16, 'pbkdf2_sha256$390000$Y6Mne04LbXZJf3Azd6kPBF$scAXqRn0ekjgwk+1LzZ23RIcHp+piGTSOKXOly4m7wk=', NULL, 0, '2', 'Essotom', 'HODIA', 'dimitrihodia02@gmail.com', 0, 1, '2023-08-20 12:48:17.900248', 'Etudiant', '2023-08-07', '002', 'technology-hacker-4k-pic.jpg'),
(17, 'pbkdf2_sha256$390000$wavJhLHbgomHRF6Ixq0lyE$uNYb2FsreQnAHSXzXeZvzm3NH3EPBDdRwfv0tpGEWUc=', '2023-08-23 09:28:17.943974', 0, '', 'Essotom', 'HODIA', 'dimitrihodia12@gmail.com', 0, 1, '2023-08-23 09:28:00.080187', 'Administrateur', '2023-08-12', 'admin', '9ddd859d-fb28-4d27-b879-5b210936f2cb.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `appecole_user_groups`
--

CREATE TABLE `appecole_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `appecole_user_user_permissions`
--

CREATE TABLE `appecole_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(25, 'Can add user', 7, 'add_user'),
(26, 'Can change user', 7, 'change_user'),
(27, 'Can delete user', 7, 'delete_user'),
(28, 'Can view user', 7, 'view_user'),
(29, 'Can add devoir', 8, 'add_devoir'),
(30, 'Can change devoir', 8, 'change_devoir'),
(31, 'Can delete devoir', 8, 'delete_devoir'),
(32, 'Can view devoir', 8, 'view_devoir'),
(33, 'Can add cour', 9, 'add_cour'),
(34, 'Can change cour', 9, 'change_cour'),
(35, 'Can delete cour', 9, 'delete_cour'),
(36, 'Can view cour', 9, 'view_cour'),
(37, 'Can add soumission', 10, 'add_soumission'),
(38, 'Can change soumission', 10, 'change_soumission'),
(39, 'Can delete soumission', 10, 'delete_soumission'),
(40, 'Can view soumission', 10, 'view_soumission');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$390000$ikd9fe5SEhGjPhNAq8vIwA$t35hpRh5SnOhIJ/XUrFjWnGBEe9rIJu60ms/EttqMTc=', '2023-08-14 22:31:10.878612', 1, 'Dimitri', '', '', 'dimitrihodia0@gmail.com', 1, 1, '2023-08-14 22:30:19.968717'),
(2, 'pbkdf2_sha256$390000$RmdH5fFbQy8ZPh7iFeLvvA$lBGnCNVk7OiuJZYVF0W9RCxHSg4uB99QxANo3MvuvcU=', NULL, 0, 'essotom', '', '', '', 0, 1, '2023-08-14 22:31:40.911616');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2023-08-14 22:31:41.267884', '2', 'essotom', 1, '[{\"added\": {}}]', 4, 1),
(2, '2023-08-15 01:04:43.111130', '3', 'Bienvenu', 2, '[{\"changed\": {\"fields\": [\"R\\u00f4le\"]}}]', 7, 1),
(3, '2023-08-15 01:04:50.507521', '3', 'Bienvenu', 2, '[]', 7, 1);

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(9, 'Administrateur', 'cour'),
(8, 'AppEcole', 'devoir'),
(7, 'AppEcole', 'user'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(10, 'Etudiant', 'soumission'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2023-08-14 22:26:56.186961'),
(2, 'auth', '0001_initial', '2023-08-14 22:26:57.249832'),
(3, 'admin', '0001_initial', '2023-08-14 22:26:57.468939'),
(4, 'admin', '0002_logentry_remove_auto_add', '2023-08-14 22:26:57.500857'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2023-08-14 22:26:57.514827'),
(6, 'contenttypes', '0002_remove_content_type_name', '2023-08-14 22:26:57.622591'),
(7, 'auth', '0002_alter_permission_name_max_length', '2023-08-14 22:26:57.742209'),
(8, 'auth', '0003_alter_user_email_max_length', '2023-08-14 22:26:57.774125'),
(9, 'auth', '0004_alter_user_username_opts', '2023-08-14 22:26:57.799060'),
(10, 'auth', '0005_alter_user_last_login_null', '2023-08-14 22:26:57.881837'),
(11, 'auth', '0006_require_contenttypes_0002', '2023-08-14 22:26:57.918134'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2023-08-14 22:26:57.936099'),
(13, 'auth', '0008_alter_user_username_max_length', '2023-08-14 22:26:57.963747'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2023-08-14 22:26:57.991398'),
(15, 'auth', '0010_alter_group_name_max_length', '2023-08-14 22:26:58.023352'),
(16, 'auth', '0011_update_proxy_permissions', '2023-08-14 22:26:58.039311'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2023-08-14 22:26:58.070052'),
(18, 'sessions', '0001_initial', '2023-08-14 22:26:58.323045'),
(19, 'AppEcole', '0001_initial', '2023-08-14 23:45:59.038158'),
(20, 'AppEcole', '0002_alter_user_birthdate', '2023-08-15 01:11:47.394486'),
(21, 'AppEcole', '0003_devoir', '2023-08-15 20:35:10.854995'),
(22, 'AppEcole', '0004_alter_devoir_projet', '2023-08-15 20:39:06.985118'),
(23, 'AppEcole', '0004_devoir_profil_alter_user_role', '2023-08-18 10:30:34.477025'),
(24, 'AppEcole', '0005_remove_devoir_profil_user_profil', '2023-08-18 10:50:53.721710'),
(25, 'AppEcole', '0006_alter_user_profil', '2023-08-20 11:35:43.850495'),
(26, 'Administrateur', '0001_initial', '2023-08-21 00:33:38.614475'),
(27, 'Etudiant', '0001_initial', '2023-08-21 03:23:03.836855'),
(28, 'Etudiant', '0002_alter_soumission_projet', '2023-08-21 03:55:10.672838'),
(29, 'Etudiant', '0003_alter_soumission_projet', '2023-08-21 03:56:17.096788');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('2l0rpjk53xr3m9lu5dkm5bx5s77sq57n', '.eJxVjEEOwiAQRe_C2pAZCkVduu8ZyDBMpWogKe3KeHfbpAvdvvf-f6tA65LD2mQOU1JXhahOvzASP6XsJj2o3KvmWpZ5inpP9GGbHmqS1-1o_w4ytbytL853OIpH9gQEli1Hz9CfjeO0QXTJWgYwAgYSeYloIwiMPXTeoVOfL_kQN3U:1qYvnO:nBKhfnd6-cm5xMWNB2BAw4LNL2OWG8gFtP24dQiQWMU', '2023-09-06 21:53:46.455058'),
('bql4lfg9xdmwujpiqeoy9mb8gxk1pc0s', '.eJxVjEEOwiAQAP_C2RBgdQGP3vsGsrAbqRqalPZk_Lsh6UGvM5N5q0T7VtPeZU0zq6sK6vTLMpWntCH4Qe2-6LK0bZ2zHok-bNfTwvK6He3foFKvY-tDAA9CDk30iODz2ZbsJKJjG6gYZMYIYJ1cMjA6cIwY0HjyJFF9vrZqNss:1qXyFb:XzbHMR2-DLx7X2r_XU_DRcdMMdjcr1gfNtO0nDgNB40', '2023-09-04 06:18:55.589861'),
('poffj62f0jz3hziz1h4txkzd6sqauaao', '.eJxVjLsOAiEUBf-F2hDIXWBjae83kPtCVg0k-6iM_66bbKHtmZnzMhm3teZt0TlPYs7GD-b0OxLyQ9tO5I7t1i33ts4T2V2xB13stYs-L4f7d1Bxqd9aU0AHFAiLChaQIDF6ZQRHXMQDYJECREoaBmbvFOKYNKWRPEsw7w9XezoA:1qYESk:TfnN_LbulWzukGL_oZech8SHrC9ZT0jstee1YEULeII', '2023-09-04 23:37:34.834839');

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_soumission`
--

CREATE TABLE `etudiant_soumission` (
  `id` bigint(20) NOT NULL,
  `matiere` varchar(100) NOT NULL,
  `projet` varchar(100) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `etudiant_soumission`
--

INSERT INTO `etudiant_soumission` (`id`, `matiere`, `projet`, `user_id`) VALUES
(2, 'Anglais', 'TD.txt', 11),
(3, 'Anglais', 'TD.txt', 11),
(4, 'Anglais', 'TD.txt', 11),
(5, 'Anglais', 'TD.txt', 11),
(6, 'Anglais', 'TD.txt', 11);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `administrateur_cour`
--
ALTER TABLE `administrateur_cour`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Administrateur_cour_enseignant_id_827d99e6_fk_AppEcole_user_id` (`enseignant_id`);

--
-- Index pour la table `appecole_devoir`
--
ALTER TABLE `appecole_devoir`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `appecole_user`
--
ALTER TABLE `appecole_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `appecole_user_groups`
--
ALTER TABLE `appecole_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AppEcole_user_groups_user_id_group_id_2905ab51_uniq` (`user_id`,`group_id`),
  ADD KEY `AppEcole_user_groups_group_id_f71fbe52_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `appecole_user_user_permissions`
--
ALTER TABLE `appecole_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `AppEcole_user_user_permi_user_id_permission_id_38510c50_uniq` (`user_id`,`permission_id`),
  ADD KEY `AppEcole_user_user_p_permission_id_713c1f51_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `etudiant_soumission`
--
ALTER TABLE `etudiant_soumission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Etudiant_soumission_user_id_bb6aad6e_fk_AppEcole_user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `administrateur_cour`
--
ALTER TABLE `administrateur_cour`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `appecole_devoir`
--
ALTER TABLE `appecole_devoir`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT pour la table `appecole_user`
--
ALTER TABLE `appecole_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `appecole_user_groups`
--
ALTER TABLE `appecole_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `appecole_user_user_permissions`
--
ALTER TABLE `appecole_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT pour la table `etudiant_soumission`
--
ALTER TABLE `etudiant_soumission`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `administrateur_cour`
--
ALTER TABLE `administrateur_cour`
  ADD CONSTRAINT `Administrateur_cour_enseignant_id_827d99e6_fk_AppEcole_user_id` FOREIGN KEY (`enseignant_id`) REFERENCES `appecole_user` (`id`);

--
-- Contraintes pour la table `appecole_user_groups`
--
ALTER TABLE `appecole_user_groups`
  ADD CONSTRAINT `AppEcole_user_groups_group_id_f71fbe52_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `AppEcole_user_groups_user_id_c488f0e8_fk_AppEcole_user_id` FOREIGN KEY (`user_id`) REFERENCES `appecole_user` (`id`);

--
-- Contraintes pour la table `appecole_user_user_permissions`
--
ALTER TABLE `appecole_user_user_permissions`
  ADD CONSTRAINT `AppEcole_user_user_p_permission_id_713c1f51_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `AppEcole_user_user_p_user_id_55e00d0d_fk_AppEcole_` FOREIGN KEY (`user_id`) REFERENCES `appecole_user` (`id`);

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `etudiant_soumission`
--
ALTER TABLE `etudiant_soumission`
  ADD CONSTRAINT `Etudiant_soumission_user_id_bb6aad6e_fk_AppEcole_user_id` FOREIGN KEY (`user_id`) REFERENCES `appecole_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
