-- phpMyAdmin SQL Dump
-- version 4.5.4.1
-- http://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Mar 17 Décembre 2019 à 08:26
-- Version du serveur :  5.7.11
-- Version de PHP :  7.2.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `base_blog`
--

-- --------------------------------------------------------

--
-- Structure de la table `articles`
--

CREATE TABLE `articles` (
  `id_article` int(11) NOT NULL,
  `titre_article` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `article` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `article_court` text NOT NULL,
  `actif` tinyint(1) NOT NULL DEFAULT '1',
  `commentaire` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `articles`
--

INSERT INTO `articles` (`id_article`, `titre_article`, `article`, `article_court`, `actif`, `commentaire`) VALUES
(2, 'foot', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a arcu et nisi pulvinar lacinia finibus ut augue. Praesent bibendum aliquam convallis. In fermentum justo sed lectus lacinia tincidunt. Donec vehicula et metus vel convallis. Duis malesuada fermentum lacus et fermentum. Sed felis eros, ornare vitae venenatis eu, consequat eget est. In sagittis est sed ante interdum imperdiet. Proin luctus eleifend euismod. Aliquam in congue odio. Aenean sollicitudin pharetra velit sed dignissim. Phasellus dictum augue arcu, in tincidunt lectus pretium et. Phasellus massa nibh, elementum ut velit sit amet, efficitur sagittis orci. Maecenas convallis enim sit amet libero laoreet dapibus. Duis pharetra posuere mauris, at rhoncus lectus dapibus et.\n\nMaecenas quis dictum sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec bibendum, sem vitae tempus elementum, enim lacus consectetur magna, ut fermentum tellus enim eu orci. Sed faucibus risus et ligula tempus, ut aliquet nulla molestie. In varius dolor sit amet ipsum placerat ultrices. Duis tempus mauris pellentesque nisi malesuada accumsan. Integer felis enim, luctus quis volutpat in, consectetur id ligula. Donec non interdum nisl, nec accumsan velit. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed condimentum nisl at lorem varius consectetur. Suspendisse nec enim in odio cursus aliquam at a purus. Integer cursus ante quis bibendum varius. Integer sollicitudin eros in nisl posuere, sit amet molestie ante imperdiet. Sed faucibus nisl sed turpis porta semper.', '', 1, 1),
(3, 'cuisine de sport', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris a arcu et nisi pulvinar lacinia finibus ut augue. Praesent bibendum aliquam convallis. In fermentum justo sed lectus lacinia tincidunt. Donec vehicula et metus vel convallis. Duis malesuada fermentum lacus et fermentum. Sed felis eros, ornare vitae venenatis eu, consequat eget est.', '', 1, 0),
(4, 'cuisine pour l\'hiver', 'cuisine pour l\'hiver', '', 0, 1),
(5, 'cuisine pour l\'hiver', 'cuisine pour l\'hiver', 'cuisine pour l\'hiver', 1, 1),
(6, 'cuisine pour l\'hiver', 'cuisine pour l\'hiver', '', 0, 1),
(7, 'foot', '', '', 1, 1),
(8, 'foot', '', '', 1, 1),
(9, 'cuisine de sport 2020', 'cuisine de sport 2020', 'cuisine de sport 2020', 1, 1),
(10, 'cuisine de sport 2020', 'cuisine de sport 2020', 'cuisine de sport 2020', 1, 1),
(11, 'cuisine de sport 2020', 'cuisine de sport 2020', 'cuisine de sport 2020', 1, 1),
(12, 'foot formation', 'foot formation', 'foot formation', 1, 1),
(13, 'foot formation', 'foot formation', 'foot formation', 1, 1),
(14, 'foot formation', 'qsdqsdq', 'qsdqsdqs', 1, 1),
(15, 'foot formation', 'qsdqsdq', 'qsdqsdqs', 1, 1),
(16, 'cuisine pour l\\\'hiver', 'cuisine pour l\\\'hiver', 'cuisine pour l\\\'hiver', 1, 1),
(17, 'cuisine pour l\\\'hiver', 'cuisine pour l\\\'hiver', 'cuisine pour l\\\'hiver', 1, 1),
(18, 'cuisine de sport 2020', 'cuisine de sport 2020', 'cuisine de sport 2020', 1, 1),
(19, 'cuisine de sport 2020', 'cuisine de sport 2020', 'cuisine de sport 2020', 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id_categorie` int(11) NOT NULL,
  `nom_cat` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `categories`
--

INSERT INTO `categories` (`id_categorie`, `nom_cat`) VALUES
(1, 'sport'),
(2, 'hiver'),
(3, 'formation'),
(4, 'printemps');

-- --------------------------------------------------------

--
-- Structure de la table `liaisons`
--

CREATE TABLE `liaisons` (
  `id_liaison` int(11) NOT NULL,
  `id_article` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `liaisons`
--

INSERT INTO `liaisons` (`id_liaison`, `id_article`, `id_user`, `id_categorie`) VALUES
(5, 2, 1, 1),
(6, 3, 1, 1),
(7, 4, 1, 2),
(8, 5, 1, 2),
(9, 6, 1, 2),
(10, 7, 1, 1),
(11, 8, 1, 1),
(12, 9, 1, 1),
(13, 10, 1, 1),
(14, 11, 1, 1),
(15, 12, 1, 3),
(16, 13, 1, 3),
(17, 14, 1, 3),
(18, 15, 1, 3),
(19, 16, 1, 2),
(20, 17, 1, 2),
(21, 18, 1, 1),
(22, 19, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `mail` varchar(100) NOT NULL,
  `passe` varchar(50) NOT NULL,
  `niv` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `nom`, `prenom`, `mail`, `passe`, `niv`) VALUES
(1, 'Munoz', 'Serge', 'smtjv@laposte.net', 'serge', 1),
(2, 'Olive', 'Pierre', 'olive@gmail.com', 'olive', 5);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `articles`
--
ALTER TABLE `articles`
  ADD PRIMARY KEY (`id_article`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_categorie`);

--
-- Index pour la table `liaisons`
--
ALTER TABLE `liaisons`
  ADD PRIMARY KEY (`id_liaison`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `articles`
--
ALTER TABLE `articles`
  MODIFY `id_article` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id_categorie` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT pour la table `liaisons`
--
ALTER TABLE `liaisons`
  MODIFY `id_liaison` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
