-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 06 Décembre 2016 à 04:09
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
-- Structure de la table `ban`
--

CREATE TABLE IF NOT EXISTS `ban` (
  `id_ban` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_ban`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Structure de la table `log_connection`
--

CREATE TABLE IF NOT EXISTS `log_connection` (
  `id_log_connection` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `phase` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_connection`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

--
-- Contenu de la table `log_connection`
--

INSERT INTO `log_connection` (`id_log_connection`, `id_user`, `phase`, `attempts`, `date`) VALUES
(25, 38, 0, 0, '2016-12-06 03:08:51'),
(24, 37, 0, 0, '2016-12-06 03:08:51'),
(23, 36, 0, 0, '2016-12-06 03:08:51');

-- --------------------------------------------------------

--
-- Structure de la table `log_password`
--

CREATE TABLE IF NOT EXISTS `log_password` (
  `id_log_password` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `password` varchar(500) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_password`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=59 ;

--
-- Contenu de la table `log_password`
--

INSERT INTO `log_password` (`id_log_password`, `id_user`, `password`, `date`) VALUES
(58, 38, '555cf334538f47204bd876f5cf70bfc414dd007d2a120cc2c9dcf5136ba28982e981727aba394d39919c92d44c7b76e303215a37f166b0339366d57d5f6b6202:3f59755a1eab5192646d932950d99e214f454ed74809948e76725bd855ebcaefb0a6ad7dedac3224da850f7035ca016136ff1320d76ea4c6ccd354d9b21a2343', '2016-12-06 03:08:51'),
(57, 37, '30a06955fa0b93cb37b0c4498c1b337135e6b2a9e6162d0e09e14b08da248199461bf6a2310fd838f5d5c888d837af54fe79c8b1dbbcd22543bb74361789aeee:bec34f767ad403754aab069d15b6d6537ff8e7a0a59dc9bf8a62884f4f7f9a3a7c6e30c6ac06833300c497666c01bd966178581b869b6f1c8f366cee1b3c56ce', '2016-12-06 03:08:51'),
(56, 36, '5b3d427597b45eed0eb319947dbd96328a18ecab1ca8fc3e66ece96318e07168228ac2f7f3801ee1b7014ec2d155914adf263c51f19bb88a59db343f5cb50f26:4d38a805e9f044e018b326fe29e3a8fd8f649b0f881a3f6336573808f479c88da3d81c127e3315111a2bdf1b601c2f86a16b72c6f31a4083f43bba5f9e70cde8', '2016-12-06 03:08:51');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE IF NOT EXISTS `role` (
  `id_role` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `maxInactiveInterval` int(11) NOT NULL,
  `maxAttempts` int(11) NOT NULL DEFAULT '5',
  `maxTimeForPhase1` bigint(20) NOT NULL,
  PRIMARY KEY (`id_role`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Contenu de la table `role`
--

INSERT INTO `role` (`id_role`, `name`, `maxInactiveInterval`, `maxAttempts`, `maxTimeForPhase1`) VALUES
(1, 'admin', 1200, 5, 60000),
(2, 'userCercle', 600, 5, 60000),
(3, 'userCarre', 600, 5, 60000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `id_role` int(11) NOT NULL,
  `username` varchar(128) NOT NULL,
  `password` varchar(500) NOT NULL,
  `surname` varchar(128) NOT NULL,
  `name` varchar(128) NOT NULL,
  `avatar` varchar(128) NOT NULL DEFAULT './img/users/profile.png',
  `country` varchar(128) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_user`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(37, 2, 'usercercle@test.com', '30a06955fa0b93cb37b0c4498c1b337135e6b2a9e6162d0e09e14b08da248199461bf6a2310fd838f5d5c888d837af54fe79c8b1dbbcd22543bb74361789aeee:bec34f767ad403754aab069d15b6d6537ff8e7a0a59dc9bf8a62884f4f7f9a3a7c6e30c6ac06833300c497666c01bd966178581b869b6f1c8f366cee1b3c56ce', 'Cercle', 'Cercle', './img/users/profile.png', 'France', '2016-12-06 03:08:51'),
(38, 3, 'usercarre@test.com', '555cf334538f47204bd876f5cf70bfc414dd007d2a120cc2c9dcf5136ba28982e981727aba394d39919c92d44c7b76e303215a37f166b0339366d57d5f6b6202:3f59755a1eab5192646d932950d99e214f454ed74809948e76725bd855ebcaefb0a6ad7dedac3224da850f7035ca016136ff1320d76ea4c6ccd354d9b21a2343', 'Carre', 'User', './img/users/profile.png', 'Canada', '2016-12-06 03:08:51'),
(36, 1, 'admin@test.com', '5b3d427597b45eed0eb319947dbd96328a18ecab1ca8fc3e66ece96318e07168228ac2f7f3801ee1b7014ec2d155914adf263c51f19bb88a59db343f5cb50f26:4d38a805e9f044e018b326fe29e3a8fd8f649b0f881a3f6336573808f479c88da3d81c127e3315111a2bdf1b601c2f86a16b72c6f31a4083f43bba5f9e70cde8', 'Best', 'Admin', './img/users/test.png', 'Canada', '2016-12-06 03:08:50');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
