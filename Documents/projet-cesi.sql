-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 11 mai 2021 à 20:13
-- Version du serveur :  10.4.17-MariaDB
-- Version de PHP : 8.0.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projet-cesi`
--

DELIMITER $$
--
-- Procédures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `aff_article` (IN `id` INT)  BEGIN
UPDATE bloggy.articles set vues = vues+1 where idArticles=id;
SELECT * FROM bloggy.articles where idArticles=id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `accessibilite`
--

CREATE TABLE `accessibilite` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `accessibilite`
--

INSERT INTO `accessibilite` (`id`, `libelle`) VALUES
(1, 'Ressource privée'),
(2, 'Ressource publique');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE `categorie` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`id`, `libelle`) VALUES
(1, 'Communication'),
(2, 'Cultures'),
(3, 'Développement personnel'),
(4, 'Intelligence émotionnelle'),
(5, 'Loisirs'),
(6, 'Monde professionnel'),
(7, 'Parentalité'),
(8, 'Qualité de vie'),
(9, 'Recherche de sens'),
(10, 'Santé physique'),
(11, 'Santé phsychique'),
(12, 'Spiritualité'),
(13, 'Vie affective');

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `idCategories` int(10) UNSIGNED NOT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `slug` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`idCategories`, `nom`, `slug`) VALUES
(1, 'Desserts', 'desserts'),
(2, 'Entr&eacute;es', 'entrees'),
(3, 'Viandes', 'viandes'),
(4, 'Poissons', 'poissons'),
(8, 'dfg', 'un slug'),
(10, 'l\'entre', 'entre'),
(11, 'titi', 'titi'),
(12, 'tata', 'tata'),
(14, 'nom', 'slug'),
(15, 'dfzef', 'rtert'),
(16, 'df', 'dfsd');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  `etat_commentaire_id` int(11) NOT NULL,
  `ressource_id` int(11) NOT NULL,
  `commentaire_parent_id` int(11) DEFAULT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `auteur_id`, `etat_commentaire_id`, `ressource_id`, `commentaire_parent_id`, `contenu`, `date`) VALUES
(1, 5, 2, 10, NULL, 'rerum voluptatem praesentium', '1977-03-22 06:19:47'),
(2, 6, 2, 31, NULL, 'alias architecto non', '1998-11-30 17:25:05'),
(3, 5, 2, 49, 2, 'quasi consequatur id', '1981-04-13 00:09:13'),
(4, 8, 2, 8, NULL, 'assumenda nesciunt nam', '1975-03-22 11:40:49'),
(5, 5, 1, 11, NULL, 'voluptatibus laborum dolorem', '2010-03-18 03:04:54'),
(6, 3, 1, 20, 1, 'aliquam eveniet omnis', '2001-06-08 18:29:55'),
(7, 9, 3, 45, 5, 'praesentium in excepturi', '1998-08-30 22:39:48'),
(8, 7, 3, 45, 7, 'dolorem est velit', '2009-08-08 14:48:20'),
(9, 8, 2, 28, 7, 'nihil voluptas ullam', '2011-06-10 22:00:09'),
(10, 7, 1, 1, NULL, 'autem quos temporibus', '1996-06-06 05:57:55');

-- --------------------------------------------------------

--
-- Structure de la table `consultation_exploitation`
--

CREATE TABLE `consultation_exploitation` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `operation_id` int(11) NOT NULL,
  `ressource_id` int(11) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `consultation_exploitation`
--

INSERT INTO `consultation_exploitation` (`id`, `utilisateur_id`, `operation_id`, `ressource_id`, `date`) VALUES
(1, 10, 2, 19, '2013-11-06 01:56:10'),
(2, 7, 1, 31, '2011-06-22 04:13:53'),
(3, 6, 1, 34, '1987-03-28 21:13:51'),
(4, 8, 1, 40, '1991-05-07 10:21:11'),
(5, 2, 2, 11, '1982-10-14 21:09:04'),
(6, 6, 2, 6, '1973-12-15 11:52:21'),
(7, 7, 2, 4, '1993-10-01 19:47:50'),
(8, 3, 2, 30, '2020-08-07 07:56:43'),
(9, 3, 2, 20, '1996-07-25 07:40:52'),
(10, 4, 1, 16, '2013-10-17 11:45:51'),
(11, 11, 1, 38, '2021-03-07 23:31:29'),
(12, 11, 1, 38, '2021-03-08 20:44:29'),
(13, 11, 1, 38, '2021-03-13 18:52:41'),
(14, 11, 2, 38, '2021-03-13 18:53:54'),
(15, 11, 1, 30, '2021-03-13 20:07:08'),
(16, 11, 1, 38, '2021-03-21 11:32:19'),
(17, 11, 1, 38, '2021-03-23 21:02:42'),
(18, 11, 1, 38, '2021-03-26 22:02:02'),
(19, 12, 1, 38, '2021-04-12 16:08:09');

-- --------------------------------------------------------

--
-- Structure de la table `etat_commentaire`
--

CREATE TABLE `etat_commentaire` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etat_commentaire`
--

INSERT INTO `etat_commentaire` (`id`, `libelle`) VALUES
(1, 'Validé'),
(2, 'Modéré'),
(3, 'A modérer');

-- --------------------------------------------------------

--
-- Structure de la table `operation`
--

CREATE TABLE `operation` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `operation`
--

INSERT INTO `operation` (`id`, `libelle`) VALUES
(1, 'Consultation'),
(2, 'Exploitation');

-- --------------------------------------------------------

--
-- Structure de la table `recherche`
--

CREATE TABLE `recherche` (
  `id` int(11) NOT NULL,
  `utilisateur_id` int(11) DEFAULT NULL,
  `date` datetime NOT NULL,
  `contenu` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recherche`
--

INSERT INTO `recherche` (`id`, `utilisateur_id`, `date`, `contenu`) VALUES
(1, 9, '1993-04-15 00:30:38', 'quisquam qui impedit'),
(2, 4, '1998-04-23 08:28:30', 'sit ut recusandae'),
(3, 3, '1982-01-23 11:10:20', 'ad dignissimos omnis'),
(4, 6, '1977-02-17 13:03:05', 'magnam id velit'),
(5, 7, '1988-04-06 04:12:38', 'in asperiores illum'),
(6, 8, '1982-11-20 13:41:49', 'ullam dolores veniam'),
(7, 6, '2010-11-10 09:19:12', 'ipsum voluptatem tempore'),
(8, 7, '1976-01-04 18:53:55', 'ullam quaerat tempora'),
(9, 7, '2020-07-16 10:14:47', 'quis aut illo'),
(10, 5, '2019-02-17 00:15:46', 'dolor alias illo'),
(11, NULL, '2021-03-06 21:32:16', 'corru');

-- --------------------------------------------------------

--
-- Structure de la table `recherche_categorie`
--

CREATE TABLE `recherche_categorie` (
  `recherche_id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recherche_categorie`
--

INSERT INTO `recherche_categorie` (`recherche_id`, `categorie_id`) VALUES
(1, 1),
(1, 13),
(2, 5),
(2, 6),
(2, 9),
(2, 10),
(3, 1),
(3, 2),
(3, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(3, 13),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 8),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 9),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(6, 7),
(6, 8),
(6, 9),
(6, 10),
(6, 12),
(6, 13),
(7, 10),
(7, 13),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(8, 9),
(8, 12),
(8, 13),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(9, 11),
(9, 12),
(9, 13);

-- --------------------------------------------------------

--
-- Structure de la table `recherche_type_relation`
--

CREATE TABLE `recherche_type_relation` (
  `recherche_id` int(11) NOT NULL,
  `type_relation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recherche_type_relation`
--

INSERT INTO `recherche_type_relation` (`recherche_id`, `type_relation_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(2, 2),
(2, 6),
(3, 2),
(3, 3),
(3, 5),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(6, 3),
(6, 4),
(6, 5),
(6, 6),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(8, 1),
(8, 2),
(8, 4),
(8, 5),
(8, 6),
(9, 2),
(10, 1);

-- --------------------------------------------------------

--
-- Structure de la table `recherche_type_ressource`
--

CREATE TABLE `recherche_type_ressource` (
  `recherche_id` int(11) NOT NULL,
  `type_ressource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `recherche_type_ressource`
--

INSERT INTO `recherche_type_ressource` (`recherche_id`, `type_ressource_id`) VALUES
(1, 4),
(1, 7),
(1, 8),
(2, 1),
(2, 3),
(2, 5),
(2, 7),
(2, 8),
(4, 1),
(4, 3),
(4, 7),
(5, 1),
(5, 2),
(5, 4),
(5, 5),
(5, 6),
(5, 7),
(5, 8),
(7, 1),
(7, 3),
(7, 4),
(7, 6),
(7, 7),
(7, 8),
(8, 1),
(8, 2),
(8, 4),
(8, 5),
(8, 6),
(8, 7),
(8, 8),
(9, 3),
(9, 4),
(9, 5),
(9, 6),
(9, 7),
(9, 8),
(10, 1),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8);

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `id` int(11) NOT NULL,
  `categorie_id` int(11) NOT NULL,
  `accessibilite_id` int(11) NOT NULL,
  `auteur_id` int(11) NOT NULL,
  `statut_ressource_id` int(11) NOT NULL,
  `type_ressource_id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lien_serveur` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_creation` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ressource`
--

INSERT INTO `ressource` (`id`, `categorie_id`, `accessibilite_id`, `auteur_id`, `statut_ressource_id`, `type_ressource_id`, `titre`, `lien_serveur`, `date_creation`) VALUES
(1, 1, 2, 2, 2, 4, 'architecto exercitationem est', '0fbf650b9101adfbe6e9ea3568600c5d.png', '2016-03-14 00:00:00'),
(2, 10, 2, 7, 2, 3, 'non reprehenderit sit', 'https://bodin.fr/occaecati-impedit-debitis-quia-quod-pariatur-optio-eos.html', '2016-06-12 00:00:00'),
(3, 3, 2, 4, 3, 8, 'aliquam et laborum', 'https://andre.org/et-consequatur-quibusdam-consequatur.html', '1987-10-14 06:34:28'),
(4, 13, 1, 6, 1, 6, 'laboriosam accusantium autem', 'https://www.legrand.net/tempore-aperiam-voluptas-laudantium-pariatur-perspiciatis-voluptatem', '2006-09-30 01:48:31'),
(5, 11, 2, 9, 4, 4, 'qui cumque quidem', 'http://www.labbe.fr/eum-incidunt-qui-temporibus-eaque-eum.html', '1997-11-28 05:50:02'),
(6, 12, 1, 6, 3, 2, 'dolores aut accusantium', 'https://www.pascal.com/quia-in-minus-error-odio-maxime-sint-dolores-quaerat', '2011-11-30 19:18:06'),
(7, 1, 2, 5, 2, 3, 'consequatur nam soluta', 'https://david.com/dignissimos-sequi-hic-sit-velit-libero-est.html', '1989-09-12 04:32:36'),
(8, 2, 2, 5, 4, 5, 'nam veniam dolore', 'http://www.lopes.fr/officiis-minima-nisi-eos-sunt.html', '1992-07-15 09:46:08'),
(9, 9, 1, 10, 2, 8, 'fugit veniam ea', 'https://www.fischer.fr/tempora-at-est-fuga-illum-tempora-et', '2013-11-01 06:41:33'),
(10, 6, 1, 10, 1, 7, 'quo voluptas sunt', 'http://www.guerin.fr/', '1990-03-06 16:03:24'),
(11, 12, 1, 2, 2, 4, 'qui repellendus rerum', 'http://barre.com/esse-unde-nulla-at-ut-cumque-pariatur.html', '2013-08-23 10:46:40'),
(12, 1, 1, 1, 2, 5, 'fugiat dolores architecto', 'https://boulay.com/aliquid-enim-ullam-ut-et.html', '1979-03-26 07:53:04'),
(13, 8, 2, 4, 2, 8, 'cumque deserunt sunt', 'https://wagner.net/non-placeat-dolorem-accusamus-harum-dolores-voluptatem.html', '2011-09-13 23:31:50'),
(14, 7, 1, 7, 1, 4, 'repellat est atque', 'http://www.rocher.com/ab-reiciendis-voluptatibus-deserunt-commodi-dolorem', '2010-05-10 04:34:42'),
(15, 11, 1, 6, 3, 8, 'soluta ex voluptatem', 'http://www.legros.com/dolore-quia-assumenda-autem-et-dolor-sequi-inventore', '2000-10-31 09:07:40'),
(16, 11, 1, 6, 2, 7, 'et nemo omnis', 'http://marin.fr/nesciunt-sint-in-cumque-modi-dolor-quia.html', '2000-01-28 02:39:54'),
(17, 13, 1, 3, 2, 2, 'esse et in', 'http://www.legall.org/et-in-voluptatum-quia-et-et-dolorum-blanditiis', '1998-11-24 16:35:57'),
(18, 7, 1, 4, 2, 2, 'aliquid architecto rerum', 'http://www.richard.net/labore-sapiente-mollitia-autem-voluptatum-sed-nobis-quia.html', '2009-01-16 05:18:45'),
(19, 1, 2, 10, 3, 5, 'vero eligendi voluptatum', 'https://diallo.com/sit-qui-ullam-tempora-nam-cupiditate-eum-et.html', '1981-02-04 19:43:43'),
(20, 7, 2, 1, 4, 6, 'dolorum at culpa', 'http://www.bonnet.org/', '1990-01-31 03:33:49'),
(21, 9, 1, 6, 1, 8, 'ut modi tempora', 'http://monnier.net/totam-quisquam-enim-deserunt-quasi-quia', '1974-05-14 07:40:31'),
(22, 9, 2, 5, 1, 3, 'libero quia eos', 'http://berger.fr/quasi-at-accusantium-impedit-repellat-ad-et-quidem', '1977-04-17 11:49:59'),
(23, 2, 1, 8, 4, 8, 'necessitatibus consequatur labore', 'http://www.dufour.com/recusandae-et-repellat-placeat-repellat-repudiandae-odio-voluptas-quas', '1984-04-14 18:29:31'),
(24, 6, 1, 4, 4, 4, 'culpa ut aut', 'http://www.roussel.fr/maxime-tempore-maxime-facere-quisquam-dolores.html', '1978-06-13 23:52:25'),
(25, 4, 2, 4, 1, 4, 'delectus qui eum', 'http://www.caron.com/', '1975-02-16 00:15:32'),
(26, 1, 1, 5, 1, 6, 'vero est in', 'http://www.traore.com/consequatur-molestiae-nesciunt-quos-voluptatem', '1971-03-20 23:07:31'),
(27, 6, 1, 8, 1, 1, 'ipsa pariatur recusandae', 'https://www.jacques.fr/facilis-adipisci-quia-veritatis-quidem', '1976-11-20 05:02:05'),
(28, 7, 2, 9, 3, 3, 'modi a quia', 'http://lelievre.fr/dolorem-numquam-tempore-cumque-ex-quis-inventore-consequuntur.html', '1992-07-24 11:37:34'),
(29, 4, 1, 8, 2, 6, 'et cupiditate et', 'https://www.leblanc.com/repudiandae-nobis-harum-impedit-magnam', '1970-08-01 15:37:14'),
(30, 9, 2, 8, 4, 3, 'tempore aut vel', 'http://www.julien.fr/a-fuga-earum-id-nisi-eveniet-sapiente.html', '1971-02-01 19:48:57'),
(31, 9, 2, 8, 2, 6, 'facilis animi placeat', 'http://devaux.com/qui-sit-quas-doloremque-aut-eum-in-molestiae', '1980-10-27 14:35:17'),
(32, 13, 1, 4, 2, 2, 'et beatae sed', 'http://joseph.fr/voluptas-dolorem-officia-sit-culpa-voluptatem', '1998-01-10 10:24:49'),
(33, 5, 1, 9, 1, 4, 'exercitationem et ut', 'http://www.voisin.org/', '1977-11-13 02:29:01'),
(34, 6, 1, 8, 4, 5, 'aspernatur sit a', 'http://lamy.net/', '1997-07-27 17:23:20'),
(35, 4, 2, 3, 3, 8, 'ab doloribus exercitationem', 'http://www.gomez.fr/distinctio-molestias-quos-sint-non-iusto-sit-ut', '2017-07-24 16:34:45'),
(36, 1, 1, 5, 3, 8, 'asperiores et quisquam', 'http://www.blondel.fr/fugit-dolor-sint-asperiores-animi-dolorum', '1988-05-17 21:44:53'),
(37, 10, 1, 10, 3, 7, 'mollitia quisquam error', 'http://www.martineau.fr/magnam-maiores-et-rerum-porro-atque.html', '2002-01-03 11:37:13'),
(38, 3, 2, 1, 2, 4, 'vel corrupti quis', 'http://www.hebert.fr/repellendus-consequuntur-et-tenetur-animi-ex', '2018-06-24 17:41:27'),
(39, 11, 1, 5, 4, 7, 'dicta delectus ducimus', 'https://www.robin.com/iusto-quam-magni-ad', '1978-10-28 10:22:40'),
(40, 4, 2, 6, 4, 4, 'laboriosam ducimus maxime', 'http://costa.fr/provident-aspernatur-quidem-ea-quo-tempora-rerum-ipsam-rerum.html', '2019-12-21 23:07:17'),
(41, 12, 2, 2, 3, 4, 'quis voluptatibus quis', 'https://jacques.fr/omnis-quos-repudiandae-maiores-aut-corporis-consectetur-velit.html', '1982-12-05 04:35:16'),
(42, 4, 1, 3, 1, 3, 'officia vel voluptas', 'https://dupuis.fr/excepturi-magnam-corporis-minus-quos.html', '1989-03-06 21:06:55'),
(43, 8, 1, 10, 2, 5, 'maiores et sit', 'http://www.guillon.com/porro-et-nemo-cupiditate-odit-ut', '2001-12-16 20:09:45'),
(44, 5, 1, 8, 1, 1, 'voluptas rem distinctio', 'https://www.bourdon.com/eaque-placeat-molestiae-voluptas', '1975-03-26 16:30:23'),
(45, 1, 2, 6, 4, 7, 'vel sint aut', 'http://www.royer.fr/', '2000-11-02 18:15:27'),
(46, 10, 1, 1, 2, 5, 'voluptas ut explicabo', 'http://renard.fr/autem-repellat-sed-officia-quod-dolorum', '2019-11-04 01:43:48'),
(47, 4, 1, 9, 2, 5, 'est possimus vel', 'https://www.pages.fr/consequatur-natus-optio-maxime-et', '1981-01-07 07:46:50'),
(48, 12, 2, 6, 3, 1, 'ex dolores quisquam', 'https://www.thierry.com/qui-et-dignissimos-molestiae-architecto-veritatis-illo', '2009-09-28 06:13:35'),
(49, 1, 2, 2, 1, 7, 'autem ex libero', 'http://henry.net/consectetur-sapiente-vel-alias-rem-magnam', '1995-12-22 12:15:27'),
(50, 5, 2, 5, 3, 6, 'corporis velit illum', 'https://hardy.fr/eligendi-nemo-molestias-aut-cumque.html', '1986-02-04 21:14:38');

-- --------------------------------------------------------

--
-- Structure de la table `ressource_type_relation`
--

CREATE TABLE `ressource_type_relation` (
  `ressource_id` int(11) NOT NULL,
  `type_relation_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `ressource_type_relation`
--

INSERT INTO `ressource_type_relation` (`ressource_id`, `type_relation_id`) VALUES
(1, 6),
(2, 4),
(2, 5),
(3, 1),
(4, 6),
(5, 1),
(5, 2),
(5, 3),
(5, 5),
(6, 3),
(7, 4),
(7, 6),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(8, 6),
(9, 1),
(9, 2),
(9, 5),
(9, 6),
(10, 1),
(11, 6),
(12, 2),
(13, 1),
(13, 5),
(14, 1),
(14, 6),
(15, 1),
(15, 2),
(15, 4),
(15, 5),
(15, 6),
(16, 4),
(16, 6),
(17, 1),
(17, 2),
(17, 3),
(17, 4),
(17, 5),
(17, 6),
(18, 2),
(18, 4),
(18, 5),
(18, 6),
(19, 1),
(19, 2),
(19, 3),
(19, 4),
(19, 6),
(20, 5),
(21, 1),
(21, 2),
(21, 3),
(21, 5),
(21, 6),
(22, 1),
(22, 2),
(22, 4),
(22, 5),
(22, 6),
(23, 2),
(23, 3),
(23, 4),
(23, 5),
(23, 6),
(24, 1),
(24, 2),
(24, 3),
(24, 4),
(24, 5),
(24, 6),
(25, 1),
(25, 2),
(25, 3),
(25, 4),
(25, 5),
(25, 6),
(26, 1),
(26, 4),
(27, 1),
(27, 2),
(27, 3),
(27, 4),
(27, 5),
(27, 6),
(28, 2),
(28, 5),
(28, 6),
(29, 2),
(29, 3),
(29, 4),
(29, 5),
(30, 1),
(30, 4),
(31, 1),
(31, 2),
(31, 3),
(31, 4),
(31, 5),
(32, 2),
(32, 3),
(32, 4),
(32, 6),
(33, 1),
(33, 2),
(33, 4),
(33, 5),
(33, 6),
(34, 2),
(35, 5),
(36, 2),
(36, 5),
(37, 2),
(38, 2),
(38, 3),
(38, 4),
(39, 2),
(39, 3),
(40, 2),
(40, 3),
(40, 6),
(41, 3),
(41, 4),
(42, 1),
(42, 2),
(42, 5),
(42, 6),
(43, 1),
(43, 6),
(44, 1),
(44, 2),
(44, 3),
(44, 5),
(44, 6),
(45, 1),
(45, 4),
(45, 5),
(45, 6),
(46, 2),
(46, 4),
(46, 5),
(46, 6),
(47, 1),
(47, 4),
(47, 6),
(48, 2),
(49, 2),
(49, 4),
(49, 6),
(50, 2),
(50, 3),
(50, 4),
(50, 5),
(50, 6);

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `libelle`) VALUES
(1, 'Citoyen connecté'),
(2, 'Modérateur'),
(3, 'Administrateur ressource'),
(4, 'Super administrateur'),
(5, 'DEV');

-- --------------------------------------------------------

--
-- Structure de la table `statut_compte`
--

CREATE TABLE `statut_compte` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut_compte`
--

INSERT INTO `statut_compte` (`id`, `libelle`) VALUES
(1, 'Actif'),
(2, 'Désactivé');

-- --------------------------------------------------------

--
-- Structure de la table `statut_ressource`
--

CREATE TABLE `statut_ressource` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `statut_ressource`
--

INSERT INTO `statut_ressource` (`id`, `libelle`) VALUES
(1, 'En attente de validation'),
(2, 'Validée'),
(3, 'Suspendue'),
(4, 'Refusée');

-- --------------------------------------------------------

--
-- Structure de la table `type_relation`
--

CREATE TABLE `type_relation` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_relation`
--

INSERT INTO `type_relation` (`id`, `libelle`) VALUES
(1, 'Soi'),
(2, 'Conjoints'),
(3, 'Famille : enfants / parents / fratrie'),
(4, 'Professionnelle : collègues / collaborateurs / managers'),
(5, 'Amis et communautés'),
(6, 'Inconnus');

-- --------------------------------------------------------

--
-- Structure de la table `type_ressource`
--

CREATE TABLE `type_ressource` (
  `id` int(11) NOT NULL,
  `libelle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `type_ressource`
--

INSERT INTO `type_ressource` (`id`, `libelle`) VALUES
(1, 'Activité / Jeu à réaliser'),
(2, 'Article'),
(3, 'Carte défi'),
(4, 'Cours au format PDF'),
(5, 'Exercice / Atelier'),
(6, 'Fiche de lecture'),
(7, 'Jeu en ligne'),
(8, 'Vidéo');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `statut_compte_id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`roles`)),
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prenom` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero_departement` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pseudo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `role_id`, `statut_compte_id`, `email`, `roles`, `password`, `nom`, `prenom`, `numero_departement`, `pseudo`) VALUES
(1, 4, 2, 'fbenoit@sfr.fr', '[\"ROLE_SUPERADMIN\"]', '$2y$13$FXVlOq/oQl5qdEUl14Z5r.UqHoNIlO8MYBsX1/kqb5K7w35SFpjBK', 'Bertrand', 'Leveque', '91', 'lamy.noel'),
(2, 4, 1, 'vincent96@thibault.com', '[\"ROLE_SUPERADMIN\"]', '$2y$13$pYD2DM8ySPv2QlH3.n/d..XNYxd1hc8WUFsUIxrFSawix/j0ugGde', 'Catherine', 'Diallo', '01', 'cousin.gregoire'),
(3, 3, 1, 'dumas.elise@langlois.com', '[\"ROLE_ADMIN\"]', '$2y$13$a4MptxzL883.WDjAD.uV2uTxYGrHY1VA6cysqJDQ5xOEp2E7Knpp2', 'Martine', 'Laurent', '77', 'cecile.guillet'),
(4, 1, 1, 'mlebrun@dasilva.fr', '[\"ROLE_USER\"]', '$2y$13$t0S7bm1.Mf8R.CAReAUy4.SEa.z0f/Gfelcb8J2zqEOUjL/Mx9mj6', 'Corinne', 'Lucas', '93', 'btraore'),
(5, 1, 2, 'zoe09@arnaud.com', '[\"ROLE_USER\"]', '$2y$13$V1wRoA8W/un3oSXytNQeoOoB31Qb5KQZV6JqQ6J761xzgBPPSz7Aa', 'Honoré', 'Joubert', '61', 'yves17'),
(6, 1, 1, 'cit@ex.com', '[\"ROLE_USER\"]', '$2y$13$/.nFwm7zgePRjYtzlzbnOOQxPEmCDMx7d0jzcL23YBqaIW27TH3Xi', 'Guillaume', 'Renaud', '34', 'berger.jacqueline'),
(7, 2, 1, 'mod@ex.com', '[\"ROLE_MODERATEUR\"]', '$2y$13$Jk.Se9HV6nALTjiG3Xi4jOVhOmpaPmUGz7ra5LnbLVirrmEs97iCe', 'Isaac', 'Leblanc', '972', 'fdescamps'),
(8, 3, 1, 'adm@ex.com', '[\"ROLE_ADMIN\"]', '$2y$13$iPAgdsACb5aKFT7prlAk.eqwgEEVS0AcYmLTRjb0CpEh012xxQW4y', 'Valentine', 'Ollivier', '93', 'tristan67'),
(9, 4, 1, 'sup@ex.com', '[\"ROLE_SUPERADMIN\"]', '$2y$13$UUp1idxwI1qUA4r3tDr2O.l/IKCFdnWTCAIC2AsrO/xA2t7VVEzoi', 'Luc', 'Ferrand', '05', 'adam.gregoire'),
(10, 5, 1, 'dev@ex.com', '[\"ROLE_DEV\"]', '$2y$13$jPfdwx13Kf2RJB2VyPhEQOd9bcM76GvrGRp9R/OESbbL.KtLEUg7G', 'Étienne', 'Hamon', '41', 'eugene.langlois'),
(11, 1, 1, 'alp@gmail.com', '[]', '$2y$13$TaIhV3Uyt0ZR3e59FxF8N.YUwltQRQfcUUuyFa9S73pesxHpReVua', 'alp', 'er', '13', 'alp'),
(12, 1, 1, 'user1@gmail.fr', '[]', '$2y$13$wkfWilFJ1/aZ5N58CQNe/eYc94M5si8V9kbI9y94M25ST9Pbh3Q/u', 'user', '1', '13', 'user1');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_ressources_de_cote`
--

CREATE TABLE `utilisateur_ressources_de_cote` (
  `utilisateur_id` int(11) NOT NULL,
  `ressource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `utilisateur_ressources_de_cote`
--

INSERT INTO `utilisateur_ressources_de_cote` (`utilisateur_id`, `ressource_id`) VALUES
(11, 38);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur_ressources_favorites`
--

CREATE TABLE `utilisateur_ressources_favorites` (
  `utilisateur_id` int(11) NOT NULL,
  `ressource_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accessibilite`
--
ALTER TABLE `accessibilite`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`idCategories`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_67F068BC60BB6FE6` (`auteur_id`),
  ADD KEY `IDX_67F068BC3EC718C` (`etat_commentaire_id`),
  ADD KEY `IDX_67F068BCFC6CD52A` (`ressource_id`),
  ADD KEY `IDX_67F068BCFDED4547` (`commentaire_parent_id`);

--
-- Index pour la table `consultation_exploitation`
--
ALTER TABLE `consultation_exploitation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_E86D2FD5FB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_E86D2FD544AC3583` (`operation_id`),
  ADD KEY `IDX_E86D2FD5FC6CD52A` (`ressource_id`);

--
-- Index pour la table `etat_commentaire`
--
ALTER TABLE `etat_commentaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `operation`
--
ALTER TABLE `operation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `recherche`
--
ALTER TABLE `recherche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B4271B46FB88E14F` (`utilisateur_id`);

--
-- Index pour la table `recherche_categorie`
--
ALTER TABLE `recherche_categorie`
  ADD PRIMARY KEY (`recherche_id`,`categorie_id`),
  ADD KEY `IDX_9E59DC9E1E6A4A07` (`recherche_id`),
  ADD KEY `IDX_9E59DC9EBCF5E72D` (`categorie_id`);

--
-- Index pour la table `recherche_type_relation`
--
ALTER TABLE `recherche_type_relation`
  ADD PRIMARY KEY (`recherche_id`,`type_relation_id`),
  ADD KEY `IDX_6968BAD31E6A4A07` (`recherche_id`),
  ADD KEY `IDX_6968BAD3794F46CA` (`type_relation_id`);

--
-- Index pour la table `recherche_type_ressource`
--
ALTER TABLE `recherche_type_ressource`
  ADD PRIMARY KEY (`recherche_id`,`type_ressource_id`),
  ADD KEY `IDX_834EDEE31E6A4A07` (`recherche_id`),
  ADD KEY `IDX_834EDEE37B2F6F2F` (`type_ressource_id`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_939F4544BCF5E72D` (`categorie_id`),
  ADD KEY `IDX_939F45449521C487` (`accessibilite_id`),
  ADD KEY `IDX_939F454460BB6FE6` (`auteur_id`),
  ADD KEY `IDX_939F4544531F6715` (`statut_ressource_id`),
  ADD KEY `IDX_939F45447B2F6F2F` (`type_ressource_id`);

--
-- Index pour la table `ressource_type_relation`
--
ALTER TABLE `ressource_type_relation`
  ADD PRIMARY KEY (`ressource_id`,`type_relation_id`),
  ADD KEY `IDX_A62FF0F1FC6CD52A` (`ressource_id`),
  ADD KEY `IDX_A62FF0F1794F46CA` (`type_relation_id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut_compte`
--
ALTER TABLE `statut_compte`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `statut_ressource`
--
ALTER TABLE `statut_ressource`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_relation`
--
ALTER TABLE `type_relation`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `type_ressource`
--
ALTER TABLE `type_ressource`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_1D1C63B3E7927C74` (`email`),
  ADD UNIQUE KEY `UNIQ_1D1C63B386CC499D` (`pseudo`),
  ADD KEY `IDX_1D1C63B3D60322AC` (`role_id`),
  ADD KEY `IDX_1D1C63B3536BF3E2` (`statut_compte_id`);

--
-- Index pour la table `utilisateur_ressources_de_cote`
--
ALTER TABLE `utilisateur_ressources_de_cote`
  ADD PRIMARY KEY (`utilisateur_id`,`ressource_id`),
  ADD KEY `IDX_8E6E694EFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_8E6E694EFC6CD52A` (`ressource_id`);

--
-- Index pour la table `utilisateur_ressources_favorites`
--
ALTER TABLE `utilisateur_ressources_favorites`
  ADD PRIMARY KEY (`utilisateur_id`,`ressource_id`),
  ADD KEY `IDX_6A7717FCFB88E14F` (`utilisateur_id`),
  ADD KEY `IDX_6A7717FCFC6CD52A` (`ressource_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accessibilite`
--
ALTER TABLE `accessibilite`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `idCategories` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `consultation_exploitation`
--
ALTER TABLE `consultation_exploitation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `etat_commentaire`
--
ALTER TABLE `etat_commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `operation`
--
ALTER TABLE `operation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `recherche`
--
ALTER TABLE `recherche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `statut_compte`
--
ALTER TABLE `statut_compte`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `statut_ressource`
--
ALTER TABLE `statut_ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `type_relation`
--
ALTER TABLE `type_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `type_ressource`
--
ALTER TABLE `type_ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD CONSTRAINT `FK_67F068BC3EC718C` FOREIGN KEY (`etat_commentaire_id`) REFERENCES `etat_commentaire` (`id`),
  ADD CONSTRAINT `FK_67F068BC60BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_67F068BCFC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`),
  ADD CONSTRAINT `FK_67F068BCFDED4547` FOREIGN KEY (`commentaire_parent_id`) REFERENCES `commentaire` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `consultation_exploitation`
--
ALTER TABLE `consultation_exploitation`
  ADD CONSTRAINT `FK_E86D2FD544AC3583` FOREIGN KEY (`operation_id`) REFERENCES `operation` (`id`),
  ADD CONSTRAINT `FK_E86D2FD5FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `FK_E86D2FD5FC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`);

--
-- Contraintes pour la table `recherche`
--
ALTER TABLE `recherche`
  ADD CONSTRAINT `FK_B4271B46FB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`);

--
-- Contraintes pour la table `recherche_categorie`
--
ALTER TABLE `recherche_categorie`
  ADD CONSTRAINT `FK_9E59DC9E1E6A4A07` FOREIGN KEY (`recherche_id`) REFERENCES `recherche` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9E59DC9EBCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recherche_type_relation`
--
ALTER TABLE `recherche_type_relation`
  ADD CONSTRAINT `FK_6968BAD31E6A4A07` FOREIGN KEY (`recherche_id`) REFERENCES `recherche` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6968BAD3794F46CA` FOREIGN KEY (`type_relation_id`) REFERENCES `type_relation` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `recherche_type_ressource`
--
ALTER TABLE `recherche_type_ressource`
  ADD CONSTRAINT `FK_834EDEE31E6A4A07` FOREIGN KEY (`recherche_id`) REFERENCES `recherche` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_834EDEE37B2F6F2F` FOREIGN KEY (`type_ressource_id`) REFERENCES `type_ressource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `FK_939F4544531F6715` FOREIGN KEY (`statut_ressource_id`) REFERENCES `statut_ressource` (`id`),
  ADD CONSTRAINT `FK_939F454460BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_939F45447B2F6F2F` FOREIGN KEY (`type_ressource_id`) REFERENCES `type_ressource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_939F45449521C487` FOREIGN KEY (`accessibilite_id`) REFERENCES `accessibilite` (`id`),
  ADD CONSTRAINT `FK_939F4544BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);

--
-- Contraintes pour la table `ressource_type_relation`
--
ALTER TABLE `ressource_type_relation`
  ADD CONSTRAINT `FK_A62FF0F1794F46CA` FOREIGN KEY (`type_relation_id`) REFERENCES `type_relation` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_A62FF0F1FC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `FK_1D1C63B3536BF3E2` FOREIGN KEY (`statut_compte_id`) REFERENCES `statut_compte` (`id`),
  ADD CONSTRAINT `FK_1D1C63B3D60322AC` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);

--
-- Contraintes pour la table `utilisateur_ressources_de_cote`
--
ALTER TABLE `utilisateur_ressources_de_cote`
  ADD CONSTRAINT `FK_8E6E694EFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_8E6E694EFC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `utilisateur_ressources_favorites`
--
ALTER TABLE `utilisateur_ressources_favorites`
  ADD CONSTRAINT `FK_6A7717FCFB88E14F` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_6A7717FCFC6CD52A` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
