-- phpMyAdmin SQL Dump
-- version 4.1.4
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 29 Novembre 2016 à 18:49
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
-- Structure de la table `log_connection`
--

CREATE TABLE IF NOT EXISTS `log_connection` (
  `id_log_connection` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `phase` int(11) NOT NULL DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_log_connection`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Contenu de la table `log_connection`
--

INSERT INTO `log_connection` (`id_log_connection`, `id_user`, `phase`, `attempts`, `date`) VALUES
(6, 19, 0, 0, '2016-11-29 17:48:39'),
(5, 18, 0, 0, '2016-11-29 17:48:38'),
(4, 17, 0, 0, '2016-11-29 17:48:38');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `log_password`
--

INSERT INTO `log_password` (`id_log_password`, `id_user`, `password`, `date`) VALUES
(19, 19, '96a5802130e87f2c0dad94350285d39c6a14214587483ed330c7f1e4b931505ed61734ad0e832d18fd82a40c5ce7f849d1feb37a52219cbb65afc0d129e36e29:2620b1f48832d83530e9f525650f07af07d0c2d9bbaee0e3f7154099ffa532071dcc3d2d925f2b53ebf9c3d42fe0022cc9ea87ed9f3f1212f7c176965e3425b7', '2016-11-29 17:48:39'),
(18, 18, '53d5bc18b30b88d0d0351f862ec56a08091b7fadadc2f8951581bae714c29712f026a69c4b153bd9dbb84f80057e9971bd5659e309f51abdcf09cc0a2e969f7f:f581cfc0b742d9dab5ea3f7bceeb8304adf5d3499574ea80b91c43f7763c49d188d8e94cc7fe21666a2903448f8237b232fe1b4f39272e4727757afaf2620613', '2016-11-29 17:48:38'),
(17, 17, '9cbbbc39601f3acdf3e08991a1f1257da9e9dd8fba78e55d4d3b14850def630f3b4700c6f920eeaa90ab32f48dd09a7bb29eaf93c098265c56f06a4ba7e5d356:b119f73759829adc6b6beac843e821dd46468d62bd06a29f3b36eda10a8d55239648cd274b13d6e49bfcb7637e43765f12351d28be4f4554e32e2afcdad06751', '2016-11-29 17:48:38');

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
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=20 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id_user`, `id_role`, `username`, `password`, `surname`, `name`, `avatar`, `country`, `date`) VALUES
(19, 2, 'usercercle@test.com', '96a5802130e87f2c0dad94350285d39c6a14214587483ed330c7f1e4b931505ed61734ad0e832d18fd82a40c5ce7f849d1feb37a52219cbb65afc0d129e36e29:2620b1f48832d83530e9f525650f07af07d0c2d9bbaee0e3f7154099ffa532071dcc3d2d925f2b53ebf9c3d42fe0022cc9ea87ed9f3f1212f7c176965e3425b7', 'Cercle', 'Cercle', './img/users/profile.png', 'France', '2016-11-29 17:48:39'),
(17, 1, 'admin@test.com', '9cbbbc39601f3acdf3e08991a1f1257da9e9dd8fba78e55d4d3b14850def630f3b4700c6f920eeaa90ab32f48dd09a7bb29eaf93c098265c56f06a4ba7e5d356:b119f73759829adc6b6beac843e821dd46468d62bd06a29f3b36eda10a8d55239648cd274b13d6e49bfcb7637e43765f12351d28be4f4554e32e2afcdad06751', 'Best', 'Admin', './img/users/test.png', 'Canada', '2016-11-29 17:48:38'),
(18, 3, 'usercarre@test.com', '53d5bc18b30b88d0d0351f862ec56a08091b7fadadc2f8951581bae714c29712f026a69c4b153bd9dbb84f80057e9971bd5659e309f51abdcf09cc0a2e969f7f:f581cfc0b742d9dab5ea3f7bceeb8304adf5d3499574ea80b91c43f7763c49d188d8e94cc7fe21666a2903448f8237b232fe1b4f39272e4727757afaf2620613', 'Carre', 'User', './img/users/profile.png', 'Canada', '2016-11-29 17:48:38');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
