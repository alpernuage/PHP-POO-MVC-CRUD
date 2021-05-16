-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : Dim 16 mai 2021 à 22:35
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

--
-- Index pour les tables déchargées
--

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
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `FK_939F4544531F6715` FOREIGN KEY (`statut_ressource_id`) REFERENCES `statut_ressource` (`id`),
  ADD CONSTRAINT `FK_939F454460BB6FE6` FOREIGN KEY (`auteur_id`) REFERENCES `utilisateur` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_939F45447B2F6F2F` FOREIGN KEY (`type_ressource_id`) REFERENCES `type_ressource` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_939F45449521C487` FOREIGN KEY (`accessibilite_id`) REFERENCES `accessibilite` (`id`),
  ADD CONSTRAINT `FK_939F4544BCF5E72D` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
