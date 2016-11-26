-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 26 Novembre 2016 à 21:25
-- Version du serveur :  5.6.15-log
-- Version de PHP :  5.5.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `secure_webapp`
--

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `admin` tinyint(1) DEFAULT '0',
  `username` varchar(128) NOT NULL,
  `password` varchar(500) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `avatar` varchar(128) NOT NULL DEFAULT './img/users/default.jpg',
  `country` varchar(128) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `admin`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(1, 0, 'user@test.com', '0afe569504bde72f5f8971d82ae1634b418df8c68bea51576cce492458a85e34fe0b08855e6589dc29810c8f0e71583e89f771a747d60c44e9f1443597c769b7:b5087d7f7a46d401d313b28fa758da8468b11e41968e67f3d967e04840be29c6bec35e28a26d665adfe6ac77a74623e2563ee6e48bc49580afffb324bc7689cf', 'Bob', 'Dupont', './img/users/default.jpg', 'Canada', '2017-03-16 14:50:04'),
(3, 1, 'admin@test.com', '0ea0ea515f810de98c5aa584ca7392d8091e8b17539272400b2f56a493767db4df65dbf0a1c0248bf03659ed5ad285a28038619dbbbd5abcb2f2edb239355d2d:73bef88b060775af8c0b8ac383fb938320069ef9477c07b54a6d49565f0b574617ace0af9953ef5c448304c344a70e57c5063c18aa793b0b7913ab5257800858', 'Super admin', 'Yeah', './img/users/default.jpg', 'Canada', '2016-11-26 14:34:35');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
